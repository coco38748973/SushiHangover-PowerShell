function Get-Font {
    <#
    .Synopsis
        Gets the fonts currently loaded on the system
    .Description
        Uses the type System.Windows.Media.Fonts static property SystemFontFamilies,
        to retrieve all of the fonts loaded by the system.  If the Fonts type is not found,
        the PresentationCore assembly will be automatically loaded
    .Parameter font
        A wildcard to search for font names
    .Example
        # Get All Fonts
        Get-Font
    .Example
        # Get All Lucida Fonts
        Get-Font *Lucida*
    #>
    param($font = "*")

    if (-not ("Windows.Media.Fonts" -as [Type])) {
        Add-Type -AssemblyName "PresentationCore"
    }       

    [Windows.Media.Fonts]::SystemFontFamilies |
        Where-Object { $_.Source -like "$font" } 
}