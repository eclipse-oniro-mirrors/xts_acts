import { Demo01 } from './AtomicServiceSearchDemo01'
import { Demo02 } from './AtomicServiceSearchDemo02'
import { Demo03 } from './AtomicServiceSearchDemo03'
import { Demo04 } from './AtomicServiceSearchDemo04'
import { Demo05 } from './AtomicServiceSearchDemo05'
@Entry
@Component
struct AtomicServiceSearchTest {
  @State arr: number[] = [1, 2, 3]
  @State current: number = 1
  @State selectWhich: number = 1;
  @State simpleList: Array<string> = [
    'Demo01',
    'Demo02',
    'Demo03',
    'Demo04',
    'Demo05',
  ];

  build() {
    Scroll() {
      Column() {
        Text('AtomicServiceSearch').margin({ top: 40 }).decoration({
          type: TextDecorationType.Underline,
          color: Color.Black,
          style: TextDecorationStyle.SOLID
        })

        Scroll() {
          Column() {
            ForEach(this.simpleList, (item: string, index:number) => {
              Button(item)
                .width('100%')
                .height(30)
                .margin({top: 5})
                .type(ButtonType.Normal)
                .borderRadius(10)
                .backgroundColor(this.selectWhich === index + 1 ? '#808080': '#75878a')
                .align(Alignment.Start)
                .fontColor(Color.Black)
                .onClick(()=>{
                  this.selectWhich = index + 1;
                })
            }, (item: string) => item)
          }.width('100%');
        }.height(180).margin({bottom: 15});

        if (this.selectWhich === 1) {Demo01()}
        if (this.selectWhich === 2) {Demo02()}
        if (this.selectWhich === 3) {Demo03()}
        if (this.selectWhich === 4) {Demo04()}
        if (this.selectWhich === 5) {Demo05()}

      }.padding({ left: 16, right: 16 })
    }

  }


  private alert(message: string): void {
    AlertDialog.show({
      message: message
    })
  }
}
