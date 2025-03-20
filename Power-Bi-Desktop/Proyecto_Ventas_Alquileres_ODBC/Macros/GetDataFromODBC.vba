Sub obtenerPrevio()
    Dim conn As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim strConn As String
    Dim ws As Worksheet
    Dim rng As Range

    ' Establecer la conexión
    Set conn = New ADODB.Connection
    strConn = "Driver={MySQL ODBC 8.0 Unicode Driver};SERVER=localhost;DATABASE=ventas;USER=root;PASSWORD=123456789;"
    conn.Open strConn

    ' Ejecutar la consulta SQL
    Set rs = New ADODB.Recordset
    rs.Open "SELECT * FROM ventas", conn, adOpenStatic, adLockReadOnly

    ' Seleccionar la hoja y el rango de datos
    Set ws = ThisWorkbook.Sheets("previossql")
    Set rng = ws.Range("A2")

    ' Pegar los datos en la hoja de Excel
    rng.CopyFromRecordset rs

    ' Cerrar la conexión
    rs.Close
    conn.Close
    Set rs = Nothing
    Set conn = Nothing
End Sub

