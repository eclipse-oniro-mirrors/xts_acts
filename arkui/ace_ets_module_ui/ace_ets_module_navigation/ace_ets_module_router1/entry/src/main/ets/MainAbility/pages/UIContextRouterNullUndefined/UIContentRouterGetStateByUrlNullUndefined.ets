import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class RouterTmp {
  Standard: router.RouterMode = router.RouterMode.Standard;
}

let rtm: RouterTmp = new RouterTmp();

class RouterTmp1 {
  Single: router.RouterMode = router.RouterMode.Single;
}

let rtm1: RouterTmp1 = new RouterTmp1();

@Entry
@Component
struct UIContentRouterGetStateByUrlNullUndefinedTest {
  async routePage1() {
    this.getUIContext().getRouter().getStateByUrl(undefined)
  }

  async routePage2() {
    this.getUIContext().getRouter().getStateByUrl(null)
  }

  async routePage3() {
    this.getUIContext().getRouter().getStateByUrl('')
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      //undefined
      Button() {
        Text('undefined')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('getStateByUrlUndefined')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage1();
      })

      //null
      Button() {
        Text('null')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('getStateByUrlNull')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage2();
      })

      //url ''
      Button() {
        Text('empty')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('getStateByUrlEmpty')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage3();
      })
    }
    .width('100%')
    .height('100%')
  }
}