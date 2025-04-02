import { BusinessError,commonEventManager } from '@kit.BasicServicesKit';

@Component
export struct StatusClickComponent {
  build() {
    Button('Top').onClick(() => {
      // 发布公共事件
      try {
        commonEventManager.publish('usual.event.CLICK_STATUSBAR', (err: BusinessError)=>{
          if (err) {
            console.error(`xueming publish failed, code is ${err.code}, message is ${err.message}`);
          } else {
            console.info('xueming publish success');
          }
        });
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`publish failed, code is ${err.code}, message is ${err.message}`);
      }
    }).width(100).height(25).margin(3).id('Top')
  }
}