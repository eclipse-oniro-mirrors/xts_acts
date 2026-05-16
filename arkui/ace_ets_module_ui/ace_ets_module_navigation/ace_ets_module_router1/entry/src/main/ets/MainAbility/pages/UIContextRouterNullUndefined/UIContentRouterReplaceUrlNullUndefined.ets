import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class RouterTmp {
  Standard: router.RouterMode = router.RouterMode.Standard;
}

let rtm: RouterTmp = new RouterTmp();

@Entry
@Component
struct UIContentRouterReplaceUrlNullUndefinedTest {
  async routePage1() {
    this.getUIContext().getRouter().replaceUrl(undefined , rtm.Standard, (err) => {
      if (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.error(`replaceUrl failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('replaceUrl success');
    })
  }

  async routePage2() {
    this.getUIContext().getRouter().replaceUrl(null, rtm.Standard, (err) => {
      if (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.error(`replaceUrl failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('replaceUrl success');
    })
  }

  async routePage3() {
    this.getUIContext().getRouter().replaceUrl({
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
        console.error(`replaceUrl failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('replaceUrl success');
    })
  }

  async routePage4() {
    this.getUIContext().getRouter().replaceUrl({
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
        console.error(`replaceUrl failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('replaceUrl success');
    })
  }

  async routePage5() {
    this.getUIContext().getRouter().replaceUrl({
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
        console.error(`replaceUrl failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('replaceUrl success');
    })
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      //undefined
      Button() {
        Text('replace undefined')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('replaceUrlUndefined')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage1();
      })

      //null
      Button() {
        Text('replace null')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('replaceUrlNull')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage2();
      })

      //url ''
      Button() {
        Text('replace url empty')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('replaceUrlEmpty')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage3();
      })

      //recoverable true
      Button() {
        Text('replaceRecoverableTrue')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('replaceUrlRecoverableTrue')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage4();
      })

      //recoverable false
      Button() {
        Text('replaceUrlRecoverable false')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('replaceUrlRecoverableFalse')
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