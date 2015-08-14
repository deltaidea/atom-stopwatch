module.exports = decoratePlannerHeader = ( planner ) ->
	headerMarker = planner.editor.markBufferPosition [ planner.headerRow, 0 ],
		invalidate: "touch"
		persistent: no

	decoration = planner.editor.decorateMarker headerMarker,
		type: "line"
		class: "planner-header"

	planner.editor.plannerMarkers.push headerMarker
