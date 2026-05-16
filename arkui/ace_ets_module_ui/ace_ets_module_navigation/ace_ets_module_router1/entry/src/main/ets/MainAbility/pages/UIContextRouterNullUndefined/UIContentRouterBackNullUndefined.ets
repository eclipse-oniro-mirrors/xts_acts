import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class RouterTmp {
  Standard: router.RouterMode = router.RouterMode.Standard;
}

let rtm: RouterTmp = new RouterTmp();

@Entry
@Component
struct UIContentRouterBackNullUndefinedTest {
  async routePage1() {
    this.getUIContext().getRouter().back(undefined)
  }

  async routePage2() {
    this.getUIContext().getRouter().back(null)
  }

  async routePage3() {
    this.getUIContext().getRouter().back({
      url: '',
      params: {
        data1: 'message',
        data2: {
          data3: [123, 456, 789]
        }
      }
    })
  }

  async routePage4() {
    this.getUIContext().getRouter().back({
      url: 'pages/Indextab',
      recoverable: true,
      params: {
        data1: 'message',
        data2: {
          data3: [123, 456, 789]
        }
      }
    })
  }

  async routePage5() {
    this.getUIContext().getRouter().back({
      url: 'pages/Indextab',
      recoverable: false,
      params: {
        data1: 'message',
        data2: {
          data3: [123, 456, 789]
        }
      }
    })
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      //undefined
      Button() {
        Text('back undefined')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('backUndefined')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage1();
      })

      //null
      Button() {
        Text('back null')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('backNull')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage2();
      })

      //url ''
      Button() {
        Text('back url empty')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('backEmpty')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage3();
      })

      //recoverable true
      Button() {
        Text('backRecoverableTrue')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('backRecoverableTrue')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage4();
      })

      //recoverable false
      Button() {
        Text('backRecoverableFalse')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('backRecoverableFalse')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage5();
      })
    }
    .width('100%')
    .height('100%')
  }
}