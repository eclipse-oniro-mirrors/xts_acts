'use static'
import { Entry, Component, Builder, Row, RowOptions, Flex, Image, Button, Text, Margin, $r,
  FlexDirection, PopupOptions, CustomPopupOptions, Position, Padding, KeyboardAvoidMode,
  Color, PopupStateChangeParam, Placement} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct PopupExample {
  @State customPopup: boolean = false;
  @State isBindPopup: boolean = true;
  @State cnt: int = 0;

  @Builder popupBuilder() {
    Row({ space: 2 } as RowOptions) {
      Button('builder')
        .id('Btn_builder')
        .onClick(() => {
          this.cnt++;
          this.customPopup = false;
        })
    }.width(100).height(50).padding(5)
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Button('CustomPopupOptions')
        .id('Btn_show')
        .onClick(() => {
          this.customPopup = true;
        })
        .bindPopup(this.customPopup, this.isBindPopup ? undefined : {
          builder: this.popupBuilder,
          placement: Placement.Top,
          mask: {color:'#33000000'},
          popupColor: Color.Yellow,
          enableArrow: true,
          keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
          showInSubWindow: false,
          onStateChange: (e: PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.customPopup = false;
            }
          }
        } as CustomPopupOptions)

      Button('btnBindPopup : ' + this.isBindPopup)
        .id('Btn_bindPopup')
        .onClick(() => {
          this.isBindPopup = !this.isBindPopup
        })
      Text(`bindPopup:${this.cnt}`)
        .id('Text_bindPopup')
    }.width('100%').padding({ top: 5 } as Padding)
  }
}