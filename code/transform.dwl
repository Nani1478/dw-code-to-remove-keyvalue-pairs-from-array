   //removibg single key value pair to use mask we have to import dw values //
/*((payload mask  "SSN" with "") mask "dob" with "") map (
       data: $ mapObject ((value, key, index) -> 
       if (key ~= "address")
            ("Zipcode": (value splitBy " ")[-1])
            else ((key): value)
       )filterObject ((value, key, index) -> (((key) as String ) != ["id"]))
).data*/
   //removing multiple key value pairs//
/*((payload mask  "SSN" with "") mask "dob" with "") map (
       data: $ mapObject ((value, key, index) -> 
       if (key ~= "address")
            ("Zipcode": (value splitBy " ")[-1])
            else ((key): value)
       )filterObject ((value, key, index) -> !(["id","employeeCode"] contains ((key) as String)))
).data*/

   //another way to execute code remove and eddit single key value pair//
/*payload map{

  test: $ mapObject ((value, key, index) -> 
  
  if(((key as String) == "SSN") or ((key as String) == "dob"))
        ((key):   "" )
            else if(key  ~= "address") 
                ("zipcode": (value splitBy  " ")[-1]) 
                else ((key): value) 
  ) filterObject ((value, key, index) -> ((key as String) != "id")) 
}.test */

  //masking and removing multiple key value pairs from an array of objects//
/*payload map{

  test: $ mapObject ((value, key, index) -> 
  
  if(((key as String) == "SSN") or ((key as String) == "dob"))
        ((key):   "" )
            else if(key  ~= "address") 
                ("zipcode": (value splitBy  " ")[-1]) 
                else ((key): value) 
  ) filterObject ((value, key, index) -> !(["id", "phoneNumber", "region"] contains (key as String) ))
}.test*/
  
      //removing a key value pair in different way//

/*payload map{

  test: $-"id" mapObject ((value, key, index) -> 
  
  if(((key as String) == "SSN") or ((key as String) == "dob"))
        ((key):   "" )
            else if(key  ~= "address") 
                ("zipcode": (value splitBy  " ")[-1]) 
                else ((key): value) 
  ) 
}.test*/