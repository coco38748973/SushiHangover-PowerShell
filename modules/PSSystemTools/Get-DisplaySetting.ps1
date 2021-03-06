function Get-DisplaySetting
{
    <#
    .Synopsis
    Gets the screen width and height.

    .Description
    The Get-DisplaySetting function gets the width and height of the primary display monitor, in pixels. This function has no parameters.

    .Notes
    Get-DisplaySetting uses the GetSystemMetrics function with an index of 0 (SM_CXSCREEN) and 1 (SM_CYSCREEN).

    .Example
    Get-DisplaySetting
    #>
    param()
    Add-Type -AssemblyName System.Drawing
    New-Object Drawing.Point -Property @{
        X = ($script:systemMetrics)::GetSystemMetrics(0)
        Y = ($script:systemMetrics)::GetSystemMetrics(1)
    }
}