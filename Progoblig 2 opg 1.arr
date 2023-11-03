use context essentials2021
# Flagg bakgrunn variabler #
red-rect = rectangle(220, 160, "solid", "firebrick")
white-rect = rectangle(220, 160, "solid", "white")
steel-blue-rect = rectangle(220, 160, "solid", "steel blue")

# Kors Variabler #
white-x-rect = rectangle(220, 30, "solid", "white")
thin-blue-x-rect = rectangle(220, 20, "solid", "navy")
thick-blue-x-rect = rectangle(220, 30, "solid", "navy")
gold-x-rect = rectangle(220, 30, "solid", "gold")
thin-red-x-rect = rectangle(220, 20, "solid", "red")


fun nordisk-flagg(land :: String):
  doc: ```Program for å tegne alle de nordiske flagg```
  
  # Flagget til Norge #
  if (land == "Norge") or (land == "norge") or (land == "Norway") or (land == "norway"):
    frame(
  place-image(
    rotate(90, (thin-blue-x-rect)),
    70,80,
    place-image(thin-blue-x-rect,
      110,80,
    place-image(
      rotate(90, (white-x-rect)),
      70, 80, 
        overlay(white-x-rect,red-rect)))))
    
    # Flagget til Færøyene #
  else if (land == "Færøyene") or (land == "færøyene") or (land == "Faroe Islands") or (land == "faroe islands"):
    frame(
  place-image(
    rotate(90, (thin-red-x-rect)),
    70,80,
    place-image(thin-red-x-rect,
      110,80,
    place-image(
        rotate(90, (thick-blue-x-rect)),
      70, 80, 
        overlay(thick-blue-x-rect,white-rect)))))
    
    #Flagget til Island#    
  else if (land == "Island") or (land == "island") or (land == "Iceland") or (land == "iceland"):
    frame(
  place-image(
    rotate(90, (thin-red-x-rect)),
    70,80,
    place-image(thin-red-x-rect,
      110,80,
    place-image(
      rotate(90, (white-x-rect)),
      70, 80, 
        overlay(white-x-rect,steel-blue-rect)))))
    
    #Flagget til Finland#    
  else if (land == "Finland") or (land == "finland"):
    frame(
  place-image(
    rotate(90, (thick-blue-x-rect)),
    70, 80,
    overlay(thick-blue-x-rect, white-rect)))
    
    #Flagget til Sverige#    
  else if (land == "Sverige") or (land == "sverige") or (land == "Sweden") or (land == "sweden"):
    frame(
  place-image(
    rotate(90, (gold-x-rect)),
    70, 80,
    overlay(gold-x-rect, steel-blue-rect)))
    
    #Flagget til Danmark#    
  else if (land == "Danmark") or (land == "danmark") or (land == "Denmark") or (land == "Denmark"):
    frame(
  place-image(
    rotate(90, (white-x-rect)),
    70, 80,
    overlay(white-x-rect, red-rect)))

  else:
    "Du har ikke skrevet et akseptert nordisk flagg."
    
  end
end

nordisk-flagg("")