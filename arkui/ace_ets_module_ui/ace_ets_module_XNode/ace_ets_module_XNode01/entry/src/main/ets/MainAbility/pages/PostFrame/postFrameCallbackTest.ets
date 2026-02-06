import {FrameCallback } from '@kit.ArkUI';

class MyFrameCallback extends FrameCallback {
  private tag: string;
  public ret: string = '0';

  constructor(tag: string) {
    super()
    this.tag = tag;
  }

  onFrame(frameTimeNanos: number) {
    console.info('MyFrameCallback ' + this.tag + ' ' + frameTimeNanos.toString());
    this.ret = this.tag + '';
  }
}

@Entry
@Component
struct PostFrameCallbackIndex {
  private myFrameCallback1: MyFrameCallback = new MyFrameCallback('normTask');
  private myFrameCallback2: MyFrameCallback = new MyFrameCallback('delayTask');
  private myFrameCallback3: MyFrameCallback = new MyFrameCallback('delayTask');
  @State result1: string = '5'
  @State result2: string = '1'
  @State result3: string = '9'

  build() {
    Row() {
      Column() {
        Text(this.result1).height('5%').id('result1_id')
        Text(this.result2).height('5%').id('result2_id')
        Text(this.result3).height('5%').id('result3_id')
        Button('点击触发postFrameCallback')
          .height('5%')
          .id('postFrameCallback_id')
          .onClick(() => {
            this.getUIContext().postFrameCallback(this.myFrameCallback1);
          })
        Button('点击触发postDelayedFrameCallback')
          .height('5%')
          .id('postDelayedFrameCallback_id')
          .onClick(() => {
            this.getUIContext().postDelayedFrameCallback(this.myFrameCallback2, 1);
          })
        Button('点击触发postDelayedFrameCallback null')
          .height('5%')
          .id('postDelayedFrameCallback_null_id')
          .onClick(() => {
            this.getUIContext().postDelayedFrameCallback(this.myFrameCallback3, null);
          })

        Button('postFrameCallback结果')
          .height('5%')
          .id('postFrameCallback_value_id')
          .onClick(() => {
            this.result1 = this.myFrameCallback1.ret;
          })
        Button('postDelayedFrameCallback结果')
          .height('5%')
          .id('postDelayedFrameCallback_value_id')
          .onClick(() => {
            this.result2 = this.myFrameCallback2.ret;
          })
        Button('postDelayedFrameCallback null结果')
          .height('5%')
          .id('postDelayedFrameCallback_null_value_id')
          .onClick(() => {
            this.result3 = this.myFrameCallback2.ret;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}