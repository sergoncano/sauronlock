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
		top: true
		left: true
		right: true
		bottom: true
	}
	color: "transparent"
	WlrLayershell.layer: WlrLayer.Overlay
	exclusionMode: ExclusionMode.Ignore
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
				//this.color = "white"
				audioPlayer.play()
				videoPlayer.play()
			}
		}
		MediaPlayer {
			id: audioPlayer
			source: "assets/screech.wav" 
			audioOutput: AudioOutput {}
		}
		VideoOutput {
			id: videoOutput
			anchors.fill: parent
		}
	}
	Component.onCompleted:  {
		focusGrab.active = true 
	}

	MediaPlayer {
		id: videoPlayer
		source: "assets/sauron.mp4"
		videoOutput: videoOutput
	}

	HyprlandFocusGrab {
		id: focusGrab 
		windows: [ root ] 
	}
}
