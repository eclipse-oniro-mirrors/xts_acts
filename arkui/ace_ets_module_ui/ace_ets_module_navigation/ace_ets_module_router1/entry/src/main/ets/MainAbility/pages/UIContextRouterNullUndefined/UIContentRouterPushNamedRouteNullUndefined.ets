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
struct UIContentRouterPushNamedRouteNullUndefinedTest {
  async routePage1() {
    this.getUIContext().getRouter().pushNamedRoute(undefined , rtm.Standard, (err) => {
      if (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.error(`pushNamedRoute failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('pushNamedRoute success');
    })
  }

  async routePage2() {
    this.getUIContext().getRouter().pushNamedRoute(null, rtm.Standard, (err) => {
      if (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.error(`pushNamedRoute failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('pushNamedRoute success');
    })
  }

  async routePage3() {
    this.getUIContext().getRouter().pushNamedRoute({
      name: '',
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
        console.error(`pushNamedRoute failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('pushNamedRoute success');
    })
  }

  async routePage4() {
    this.getUIContext().getRouter().pushNamedRoute({
      name: 'IndexBack',
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
        console.error(`pushNamedRoute failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('pushNamedRoute success');
    })
  }

  async routePage5() {
    this.getUIContext().getRouter().pushNamedRoute({
      name: 'IndexBack',
      recoverable: true,
      params: {
        data1: 'message',
        data2: {
          data3: [123, 456, 789]
        }
      }
    }, rtm1.Single, (err) => {
      if (err) {
        let message = (err as BusinessError).message;
        let code = (err as BusinessError).code;
        console.error(`pushNamedRoute failed, code is ${code}, message is ${message}`);
        return;
      }
      console.info('pushNamedRoute success');
    })
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      //undefined
      Button() {
        Text('pushNamedRoute undefined')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('pushNamedRouteUndefined')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage1();
      })

      //null
      Button() {
        Text('pushNamedRoute null')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('pushNamedRouteNull')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage2();
      })

      //url ''
      Button() {
        Text('pushNamedRoute url empty')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('pushNamedRouteEmpty')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage3();
      })

      //recoverable true
      Button() {
        Text('pushNamedRouteRecoverableTrue')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('pushNamedRouteRecoverableTrue')
      .type(ButtonType.Capsule)
      .margin({ top: 20 })
      .backgroundColor('#ccc')
      .onClick(() => {
        this.routePage4();
      })

      //pushNamedRouteMode single
      Button() {
        Text('pushNamedRouteMode')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .id('pushNamedRouteMode')
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