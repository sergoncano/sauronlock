import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Window
import Quickshell.Wayland
import Quickshell.Hyprland
import QtMultimedia

PanelWindow {
	id: root
	anchors {
		top:true
		left:true
		right:true
	}
	color: "transparent"
	WlrLayershell.layer: WlrLayer.Overlay
	Rectangle {
		anchors.fill: parent
		property var unlockKey
		focus: true
		color: "transparent"
		Keys.onPressed: (event) => {
			if(!Component.completed){
				return 
			}
			if(this.unlockKey == undefined) {
				this.unlockKey = event.key
			} else if(event.key == this.unlockKey) {
				Qt.quit()
			} else {
				audioPlayer.play()
			}
		}
	}
	Component.onCompleted:  {
		focusGrab.active = true 
	}

	MediaPlayer {
		id: audioPlayer
		source: "Screech.wav" 
		audioOutput: AudioOutput {}
	}

	HyprlandFocusGrab {
		id: focusGrab 
		windows: [ root ] 
	}
}
