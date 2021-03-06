function Get-TokenFromFile {
    <#
    .Synopsis
        Gets the Tokens from a file in the Integrated Scripting Environment
    .Description
        Gets the Tokens from a file in the Integrated Scripting Environment
    .Example
        Get-TokenFromFile $psise.CurrentFile        
    #>
    param(
    # The File Object from the ISE (i.e. $psise.CurrentFile) 
    [Parameter(ValueFromPipeline=$true,
        Mandatory=$true)]    
    [Microsoft.PowerShell.Host.ISE.ISEFile]
    $file
    )
    process {
        $err = $null
        [Management.Automation.PSParser]::Tokenize($file.Editor.Text,
            [ref]$err)
        foreach ($e in $err) {
            Write-Error $e
        }
    }
}