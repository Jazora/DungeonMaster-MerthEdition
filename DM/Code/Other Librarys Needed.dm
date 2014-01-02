// AbyssDragon's Library

proc/BubbleSort(list/L)
	for(var/i = L.len; i >= 1; i--)
		for(var/j = 1; j < i; j++)
			if(Compare(L[j], L[j+1]) == -1)
				Swap(L, j, j+1)
	//return L
proc/CountingSort(list/L, max_element=100)
	var/LCopy[] = L.Copy()
	var/TempList[max_element+1]
	for(var/j in 1 to LCopy.len)
		TempList[LCopy[j]+1]++
	for(var/i in 2 to max_element+1)
		TempList[i] = TempList[i] + TempList[i-1]
	for(var/j = L.len; j > 0; j--)
		L[TempList[LCopy[j]+1]] = LCopy[j]
		TempList[LCopy[j]+1]--
	//return LCopy

proc/Compare(item1, item2)
	if(isnum(item1))
		return item2<item1?-1:(item1==item2?0:1)
	else
		return sorttextEx("[item1]", "[item2]")

proc/Swap(list/L, position1, position2)
	var/temp = L[position1]
	L[position1] = L[position2]
	L[position2] = temp

//	Deadron's TextProcs
proc
	dd_text2list(text, separator)
		var/textlength      = lentext(text)
		var/separatorlength = lentext(separator)
		var/list/textList   = new /list()
		var/searchPosition  = 1
		var/findPosition    = 1
		var/buggyText
		while (1)															// Loop forever.
			findPosition = findtext(text, separator, searchPosition, 0)
			buggyText = copytext(text, searchPosition, findPosition)		// Everything from searchPosition to findPosition goes into a list element.
			textList += "[buggyText]"										// Working around weird problem where "text" != "text" after this copytext().

			searchPosition = findPosition + separatorlength					// Skip over separator.
			if (findPosition == 0)											// Didn't find anything at end of string so stop here.
				return textList
			if (searchPosition > textlength)								// Found separator at very end of string.
				textList += ""												// So add empty element.
				return textList

	dd_list2text(list/the_list, separator)
		var/total = the_list.len
		if (total == 0)														// Nothing to work with.
			return

		var/newText = "[the_list[1]]"										// Treats any object/number as text also.
		var/count
		for (count = 2, count <= total, count++)
			if (separator) newText += separator
			newText += "[the_list[count]]"
		return newText
