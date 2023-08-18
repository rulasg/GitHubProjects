function GitHubProjectsTest_GHI_NewGHIssue_Simple{
    # Need to inject gh call for testing

    $title = "[DevTraining] Session 6"
    $body = "This is the body"
    $repoOwner = "someOwner"; $repoName = "someRepo" ; $repo = "$repoOwner/$repoName"

    $expressionPattern = 'gh issue create --repo "{0}" --title "{1}" --body "{2}"'
    $command = $expressionPattern -f $Repo,$Title,$Body

    $result = New-GhIssue -Repo $repo -Title $title -Body $body -WhatIf @InfoParameters 

    Assert-Contains -Presented $infoVar.MessageData -Expected $command

    Assert-AreEqual -Presented $result -Expected ('https://githubInstance.com/someOwner/someRepo/issues/6')

}

function GitHubProjectsTest_GHI_GetGHIssue_Simple{

    Set-GitUserTestingHelperAgent

    $repo = "rulasg/publicrepo"

    $result = Get-GhIssues -Repo $repo @InfoParameters

    Assert-IsNotNull -Object $result
    Assert-Count -Expected 3 -Presented $result
    Assert-AreEqual -Expected 'https://github.com/rulasg/publicrepo/issues' -Presented ($result[0].url | Split-Path -Parent)



}
