program define angelhair
  syntax varlist(min=2 max=2), by(varname) ///
    [ hnum(integer 20)  ///
    hcolor(string) ///
    RAinbow ///
    bgcolor(string) ///
	MAXlines(integer 0) ///
		seed(integer -1) * ]

  if "`hcolor'" == "" {
    local hcolor "red"
  }
  if "`bgcolor'" == "" {
    local bgcolor "gs13"
  }

  if `maxlines' > 0 {
  	local num = `maxlines'
  }
  else {
	  qui levelsof `by'
	  local num = r(r)
  }
  if `num' <= `hnum' {
  	display as error "maxlines must be greated than hnum"
	error 197
  }
  
  * If `by` is string, create numeric version
  capture confirm numeric variable `by'
  tempvar newby
  if (_rc != 0) {
	encode `by', gen(`newby')
  }
  else {
  	gen `newby' = `by'
  }

  qui tab `newby', matrow(ids)
  preserve
  svmat ids

  if `seed' >= 0 {
    set seed `seed'
  }
	
  quietly gen ran = runiform() if !missing(ids)
  sort ran in 1/`num'
  
  local rainbow_colors "blue blue cranberry cyan dkgreen dknavy dkorange ebblue emerald erose forest_green gold green khaki lavender lime ltblue magenta maroon midblue mint olive orange orange_red pink purple red sand sienna teal yellow sunflowerlime"

  

  forvalues i = 1/`num' {
    local id = ids[`i']
    if `hnum' >= 0 {
        local color = "`bgcolor'"
        if `i' > `num' - `hnum' {
          local color = "`hcolor'"
          if "`rainbow'" == "rainbow" {
              local color: word `i' of `rainbow_colors'
          }
        }
    }
    local formula `formula' || line `varlist' if `newby' == `id', lcolor("`color'")
  }


  twoway scatter `varlist', mcolor("white") `formula' , legend(off) `options'

  restore

end
