import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libsubscribe.so';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

function publishCB(err: BusinessError) {
  if (err) {
    console.error(`publish failed, code is ${err.code}, message is ${err.message}`);
  } else {
    console.info("publish success");
  }
}
export default function ActsCommonEventSubscribeNDKTest() {
  describe('ActsCommonEventSubscribeNDKTest', () => {

    /**
     * @tc.name   Sub_Notification_Ces_Subscriber_NDK_0003
     * @tc.number Sub_Notification_Ces_Subscriber_NDK_0003
     * @tc.desc   create_subscriber Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_Subscriber_NDK_0003', Level.LEVEL2,async (done: Function) => {
      try {
        let result =testNapi.create_subscribe_info(null);
        hilog.info(0x0000, 'testTag', 'create subscribe info : %{public}d', result);
        expect(result).assertEqual(403)
        let result1 = testNapi.create_subscriber();
        hilog.info(0x0000, 'testTag', 'create subscriber : %{public}d', result1);
        expect(result1).assertEqual(401)
        console.info("Sub_Notification_Ces_Subscriber_NDK_0003 testcase end")
        done()
      } catch (err) {
        console.info("Sub_Notification_Ces_Subscriber_NDK_0003 is fail")
        expect(false).assertEqual(true)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ces_Subscriber_NDK_0001
     * @tc.number Sub_Notification_Ces_Subscriber_NDK_0001
     * @tc.desc   Basic Function Flow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_Subscriber_NDK_0001', Level.LEVEL0,async (done:Function) => {
      const arrayStr = ["123"];
      try {
        testNapi.create_subscribe_info(arrayStr);
        testNapi.set_publisher_bundleName("com.example.myapplication444");
        testNapi.create_subscriber();
        testNapi.common_event_subscribe();
        await sleep(50)
        let options: commonEventManager.CommonEventPublishData = {
          code: 0,
          data: "initial data",
          parameters: {
            wh1: 123,
            wh2: 'B',
            wh3: 58.89,
            wh4: true,
            wh5: [123, 234, 567],
            wh6: [true, false, true],
            wh7: "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
            wh8: [11.11, 22.22, 33.33, 44.44],
            wh9: 2147483648,
            wh10: [2147483648, 555, 2147483649]
          },
          bundleName: "com.example.myapplication444"
        }
        //发布公共事件
        try {
          commonEventManager.publish("123", options, publishCB);
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error(`publish failed, code is ${err.code}, message is ${err.message}`);
        }
        await sleep(50)
        // 退订成功
        let result = testNapi.common_event_unsubscribe()
        hilog.info(0x0000, 'testTag', 'unsubscribe result : %{public}d', result);
        expect(result).assertEqual(0)
        await sleep(50)
        // 销毁订阅者成功
        let result1 = testNapi.destroy_subscriber();
        hilog.info(0x0000, 'testTag', 'destroy subscriber result : %{public}d', result1);
        expect(result1).assertEqual(400)
        // 销毁订阅者信息成功
        let result2 = testNapi.destroy_subscribe_info();
        hilog.info(0x0000, 'testTag', 'destroy subscribe info result : %{public}d', result2);
        expect(result2).assertEqual(400)
        console.info("Sub_Notification_Ces_Subscriber_NDK_0001 testcase end")
        done()
      } catch (err) {
        console.info("Sub_Notification_Ces_Subscriber_NDK_0001 is fail")
        expect(false).assertEqual(true)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ces_Subscriber_NDK_0006
     * @tc.number Sub_Notification_Ces_Subscriber_NDK_0006
     * @tc.desc   common_event_unsubscribe Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_Subscriber_NDK_0006', Level.LEVEL2,async (done:Function) => {
      try {
        let result = testNapi.common_event_unsubscribe();
        expect(result).assertEqual(401)
        console.info("Sub_Notification_Ces_Subscriber_NDK_0006 testcase end")
        done()
      } catch (err) {
        console.info("Sub_Notification_Ces_Subscriber_NDK_0006 is fail")
        expect(false).assertEqual(true)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ces_Subscriber_NDK_0005
     * @tc.number Sub_Notification_Ces_Subscriber_NDK_0005
     * @tc.desc   common_event_subscribe Interface parameter verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_Subscriber_NDK_0005', Level.LEVEL2,async (done:Function) => {
      try {
        let result = testNapi.common_event_subscribe();
        expect(result).assertEqual(401)
        const arrayStr = [];
        // The array is empty.为 401
        let result1 = testNapi.create_subscribe_info(arrayStr);
        hilog.info(0x0000, 'testTag', 'The array is empty, create subscribe info : %{public}d', result1);
        expect(result1).assertEqual(401)
        testNapi.create_subscriber();
        let result2 = testNapi.common_event_subscribe();
        expect(result2).assertEqual(401)
        // 单应用进程下，subscribe超过200,订阅失败，返回1500010
        const arrayStr2 = ["123"];
        console.info("result2:" + result2 )
        for (let i = 0; i < 199; i++) {
          testNapi.create_subscribe_info(arrayStr2);
          testNapi.set_publisher_permission("ohos.permission.NOTIFICATION_CONTROLLER");
          testNapi.set_publisher_bundleName("com.example.myapplication444");
          testNapi.create_subscriber();
          if (i == 198){
            let result3 = testNapi.common_event_subscribe();
            if (result3 == 0) {
              testNapi.create_subscriber();
              result3 = testNapi.common_event_subscribe();
              if (result3 == 0) {
                testNapi.create_subscriber();
                result3 = testNapi.common_event_subscribe();
                expect(result3).assertEqual(1500010)
              }
            }else {
              expect(result3).assertEqual(1500010)
            }
          }else{
            testNapi.common_event_subscribe();
          }
        }
        console.info("Sub_Notification_Ces_Subscriber_NDK_0005 testcase end")
        done()
      } catch (err) {
        console.info("Sub_Notification_Ces_Subscriber_NDK_0005 is fail")
        expect(false).assertEqual(true)
        done()
      }
    })
  })
}