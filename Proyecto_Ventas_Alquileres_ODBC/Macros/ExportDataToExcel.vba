Sub ExportarDatosASQL()
    Dim conn As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim strConn As String
    Dim strSQL As String
    Dim ws As Worksheet
    Dim rng As Range
    Dim row As Range
    Dim opcion As Variant
    Dim idEliminar As Long
    Dim confirmacion As String
    
    ' Establecer la conexión
    Set conn = New ADODB.Connection
    strConn = "Driver={MySQL ODBC 8.0 Unicode Driver};SERVER=localhost;DATABASE=ventas;USER=root;PASSWORD=123456789;"
    conn.Open strConn

    ' Seleccionar la hoja y el rango de datos
    Set ws = ThisWorkbook.Sheets("ventas")
    Set rng = Application.Range("ventas")
    
    ' Elegir entre insertar, actualizar o eliminar
    opcion = InputBox("¿Desea insertar (I), actualizar (U), o eliminar (D)?", "Opción")

    If UCase(opcion) = "I" Then
        ' Insertar nuevos registros
        For Each row In rng.Rows
            sqlInsertData = "INSERT INTO ventas(id,fecha,producto,cantidad,descuento,precio,precio_por_encomienda,provincia,region,forma_de_pago,total,tipo) VALUES(" _
                           & row.Cells(1).Value & ", '" & row.Cells(2).Value & "', '" & row.Cells(3).Value & "', " _
                           & row.Cells(4).Value & ", " & row.Cells(5).Value & ", " & row.Cells(6).Value & ", " _
                           & row.Cells(7).Value & ", '" & row.Cells(8).Value & "', '" & row.Cells(9).Value & "', '" _
                           & row.Cells(10).Value & "', " & row.Cells(11).Value & ", '" & row.Cells(12).Value & "')"
            
            conn.Execute sqlInsertData
        Next row
        
    ElseIf UCase(opcion) = "U" Then
        ' Actualizar registros existentes
        For Each row In rng.Rows
            id = row.Cells(1).Value
            fecha = row.Cells(2).Value
            producto = row.Cells(3).Value
            cantidad = CLng(row.Cells(4).Value)
            descuento = row.Cells(5).Value
            precio = row.Cells(6).Value
            precioPorEncomienda = row.Cells(7).Value
            provincia = row.Cells(8).Value
            region = row.Cells(9).Value
            formaDePago = row.Cells(10).Value
            total = row.Cells(11).Value
            tipo = row.Cells(12).Value
            
            ' Verificar si el registro existe
            sqlCheckExists = "SELECT * FROM ventas WHERE id = " & id
            Set rs = conn.Execute(sqlCheckExists)
            If Not rs.EOF Then
                ' Actualizar el registro existente
                sqlUpdateData = "UPDATE ventas SET fecha = " & fecha & ", producto = '" & producto & "', cantidad = " & cantidad & ", descuento = " & descuento & ", precio = " & precio & ", precio_por_encomienda = " & precioPorEncomienda & ", provincia = '" & provincia & "', region = '" & region & "', forma_de_pago = '" & formaDePago & "', total = " & total & ", tipo = '" & tipo & "' WHERE id = " & id
                conn.Execute sqlUpdateData
                rs.MoveNext
            Else
                ' Insertar nuevo registro si no existe
                sqlInsertData = "INSERT INTO ventas(id,fecha,producto,cantidad,descuento,precio,precio_por_encomienda,provincia,region,forma_de_pago,total,tipo) VALUES(" _
                               & id & ", " & fecha & ", '" & producto & "', " & cantidad & ", " & descuento & ", " & precio & ", " _
                               & precioPorEncomienda & ", '" & provincia & "', '" & region & "', '" & formaDePago & "', " & total & ", '" & tipo & "')"
                conn.Execute sqlInsertData
            End If
            rs.Close
        Next row


        
    ElseIf UCase(opcion) = "D" Then
        ' Eliminar registro por ID
        idEliminar = InputBox("Ingrese el ID del registro que desea eliminar:", "Eliminar registro")
        
        ' Confirmación de la eliminación
        confirmacion = MsgBox("¿Está seguro de que desea eliminar el registro con ID " & idEliminar & "?", vbYesNo + vbQuestion, "Confirmar eliminación")
        
        If confirmacion = vbYes Then
            ' Verificar si el registro existe
            sqlCheckExists = "SELECT * FROM ventas WHERE id = " & idEliminar
            Set rs = conn.Execute(sqlCheckExists)
            If Not rs.EOF Then
                ' Eliminar el registro existente
                sqlDeleteData = "DELETE FROM ventas WHERE id = " & idEliminar
                conn.Execute sqlDeleteData
                MsgBox "Registro con ID " & idEliminar & " eliminado correctamente.", vbInformation
            Else
                MsgBox "No se encontró ningún registro con ID " & idEliminar & ".", vbExclamation
            End If
            rs.Close
        Else
            MsgBox "Eliminación cancelada.", vbInformation
        End If
    End If

    ' Cerrar la conexión
    conn.Close

    MsgBox "Operación completada correctamente."
End Sub


