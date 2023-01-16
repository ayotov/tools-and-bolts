###################################################
#  Скрипт за четене на зодии от сайта на Edna.bg  #
#           Ангел Йотов @ 2022                    #
###################################################

function Show-Menu {
    Clear-Host
	Write-Host ""
    Write-Host "+-=(Изберете зодия)=-+"
    Write-Host "|     1: Овен        |"
    Write-Host "|     2: Телец       |"
    Write-Host "|     3: Близнаци    |"
    Write-Host "|     4: Рак         |"
    Write-Host "|     5: Лъв         |"
    Write-Host "|     6: Дева        |"
    Write-Host "|     7: Везни       |"
    Write-Host "|     8: Скорпион    |"
    Write-Host "|     9: Стрелец     |"
    Write-Host "|    10: Козирог     |"
    Write-Host "|    11: Водолей     |"
    Write-Host "|    12: Риби        |"
    Write-Host "+--------------------+"
    Write-Host "     Q: за край..."
    Write-Host ""
}

do
 {
    $WebResponse = ""
    $t1 = ""
    $t2 = ""
    $t3 = ""
    $l = 0
    Show-Menu
    $selection = Read-Host "  №"
    Write-Host ""
	switch ($selection)
    {
    '1' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/oven/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Овен")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Овен"), [int]$l)
        $t3
        pause
    } '2' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/telec/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Телец")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Телец"), [int]$l)
        $t3
        pause
    } '3' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/bliznaci/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Близнаци")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Близнаци"), [int]$l)
        $t3
        pause
    } '4' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/rak/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Рак")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Рак"), [int]$l)
        $t3
        pause
    } '5' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/luv/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Лъв")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Лъв"), [int]$l)
        $t3
        pause
    } '6' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/deva/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Дева")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Дева"), [int]$l)
        $t3
        pause
    } '7' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/vezni/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Везни")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Везни"), [int]$l)
        $t3
        pause
    } '8' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/skorpion/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Скорпион")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Скорпион"), [int]$l)
        $t3
        pause
    } '9' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/strelec/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Стрелец")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Стрелец"), [int]$l)
        $t3
        pause
    } '10' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/kozirog/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Козирог")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Козирог"), [int]$l)
        $t3
        pause
    } '11' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/vodolei/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Водолей")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Водолей"), [int]$l)
        $t3
        pause
    } '12' {
        $WebResponse = Invoke-WebRequest "https://www.edna.bg/horoskopi/ribi/dneven" -ContentType 'text/plain'
        $t1 = $WebResponse.ParsedHtml.body.outerText
		$t1 = $t1.Replace('[^\n\r\tа-яА-Я0-9"\,\.]', '')
        $t2 = $t1.Remove(0, [int]$t1.IndexOf("Днес Утре Седмичен Месечен Годишен Партньорски") + 47)
        $l  = $t2.Length - [int]$t2.IndexOf("Качества на Риби")
        $t3 = $t2.Remove([int]$t2.IndexOf("Качества на Риби"), [int]$l)
        $t3
        pause
    } 'q'  {
		Break Script
    }
    }
    
 }
 until (($selection -eq 'q') -or ($selection -eq 'Q') -or ($selection -eq 'я') -or ($selection -eq 'Я'))
