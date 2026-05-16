import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class RouterTmp {
  Standard: router.RouterMode = router.RouterMode.Standard;
}

let rtm: RouterTmp = new RouterTmp();

@Entry
@Component
struct UIContentRouterPushUrlNullUndefinedTest {
  async routePage1() {
    this.getUIContext().getRouter().pushUrl(undefined , rtm.Standard, (err) => {
      if (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.error(`pushUrl failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('pushUrl success');
    })
  }

  async routePage2() {
    this.getUIContext().getRouter().pushUrl(null, rtm.Standard, (err) => {
      if (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.error(`pushUrl failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('pushUrl success');
    })
  }

  async routePage3() {
    this.getUIContext().getRouter().pushUrl({
      url: '',
      params: {
        data1: 'message',
        data2: {
          data3: [123, 456, 789]
        }
      }
    }, rtm.Standard, (err) => {
      if (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.error(`pushUrl failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('pushUrl success');
    })
  }

  async routePage4() {
    this.getUIContext().getRouter().pushUrl({
      url: 'pages/IndexBack',
      recoverable: true,
      params: {
        data1: 'message',
        data2: {
          data3: [123, 456, 789]
        }
      }
    }, rtm.Standard, (err) => {
      if (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.error(`pushUrl failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('pushUrl success');
    })
  }

  async routePage5() {
    this.getUIContext().getRouter().pushUrl({
      url: 'pages/IndexBack',
      recoverable: false,
      params: {
        data1: 'message',
        data2: {
          data3: [123, 456, 789]
        }
      }
    }, rtm.Standard, (err) => {
      if (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.error(`pushUrl failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('pushUrl success');
    })
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      //undefined
      Button() {
        Text('undefined')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('pushUrlUndefined')
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
      .id('pushUrlNull')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage2();
      })

      //url ''
      Button() {
        Text('url empty')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('pushUrlEmpty')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage3();
      })

      //recoverable true
      Button() {
        Text('pushUrlRecoverableTrue')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('pushUrlRecoverableTrue')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage4();
      })

      //recoverable false
      Button() {
        Text('pushUrlRecoverableFalse')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('pushUrlRecoverableFalse')
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