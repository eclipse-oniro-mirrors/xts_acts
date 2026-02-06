import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libsubscribe.so';

let SUCCESS: number = 0;
let TAG:string = "ansTest"

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function commonEventCAPIPubTest() {

  describe('commonEventCAPIPubTest', (done: Function) => {
    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_0100
      * @tc.name      : 应用发布公共事件，发布带publish的事件，公共事件的结果是否符合预期结果
      * @tc.desc      : C API publish
      * @tc.size      : Large-scaleTest
      * @tc.type      : Function test
      * @tc.level     : Level 0
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_0100', Level.LEVEL0, (done: Function) => {
      let result: number = testNapi.publish();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0100 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_0200
      * @tc.name      : 应用发布公共事件，发布带publishWIthinfo的事件，有序公共事件的结果是否符合预期结果
      * @tc.desc      : C API publishWithInfo
      * @tc.size      : Large-scaleTest
      * @tc.type      : Function test
      * @tc.level     : Level 0
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_0200', Level.LEVEL0, (done: Function) => {
      let result: number = testNapi.publishWithInfo();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0200 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_0300
      * @tc.name      : 应用发布公共事件，发布带ordered的事件，有序公共事件的结果是否符合预期结果
      * @tc.desc      : C API publish ordered event
      * @tc.size      : Large-scaleTest
      * @tc.type      : Function test
      * @tc.level     : Level 0
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_0300', Level.LEVEL0, async (done: Function) => {
      let result: number = testNapi.isOrderedCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0300 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getIsOrderedCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0300 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_0400
      * @tc.name      : 应用发布公共事件，发布FinishCommonEvent，公共事件的结果是否符合预期结果
      * @tc.desc      : C API 发布FinishCommonEvent
      * @tc.size      : Large-scaleTest
      * @tc.type      : Function test
      * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_0400', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.finishCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0400 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getFinishCommonEvent()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0400 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /*
      * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_0500
      * @tc.name      : 应用发布公共事件，发布带AbortCommonEvent的事件，有序公共事件的结果是否符合预期结果
      * @tc.desc      : C API 发布FinishCommonEvent
      * @tc.size      : Large-scaleTest
      * @tc.type      : Function test
      * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_0500', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.abortCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0500 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getAbortCommonEvent2();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0500 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_0600
     * @tc.name      : 应用发布公共事件，发布带GetAbortCommonEvent的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API 发布GetAbortCommonEvent
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
   */
    it('Sub_Notification_Ces_CommonEvent_Pub_0600', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.getAbortCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0600 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getGetAbortCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0600 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_0700
     * @tc.name      : 应用发布公共事件，发布带ClearAbortCommonEvent的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API ClearAbortCommonEvent
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_0700', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.clearAbortCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0700 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getClearAbortCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0700 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_0800
     * @tc.name      : 应用发布公共事件，发布带GetCodeFromSubscriber的事件，公共事件的结果是否符合预期结果
     * @tc.desc      : C API GetCodeFromSubscriber
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_0800', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.subscriberCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0800 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getGetCodeFromSubscriber();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0800 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_0900
     * @tc.name      : 应用发布公共事件，发布带SetCodeToSubscriber的事件，公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetCodeToSubscriber
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_0900', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.subscriberCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0900 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getSetCodeToSubscriber();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0900 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_1000
     * @tc.name      : 应用发布公共事件，发布带GetDataFromSubscriber的事件，公共事件的结果是否符合预期结果
     * @tc.desc      : C API GetDataFromSubscriber
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_1000', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.subscriberCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1000 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getGetDataFromSubscriber();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1000 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_1100
     * @tc.name      : 应用发布公共事件，发布带SetDataToSubscriber的事件，公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetDataToSubscriber
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_1100', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.subscriberCommonEvent();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1100 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getSetDataToSubscriber();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1100 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_1200
     * @tc.name      : 应用发布公共事件，发布带CreatePublishInfo的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API CreatePublishInfo
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_1200', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.createPublishInfo();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1200 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_1300
     * @tc.name      : 应用发布公共事件，发布DestroyPublishInfo的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API DestroyPublishInfo
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_1300', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.destroyParameters();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1300 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })


    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_1900
     * @tc.name      : 应用发布公共事件，发布带CreateParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API CreateParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 1
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_1900', Level.LEVEL1, async (done: Function) => {
      let result: number = testNapi.createParameters();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1900 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_2000
     * @tc.name      : 应用发布公共事件，发布带DestroyParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API DestroyParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 1
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_2000', Level.LEVEL1, async (done: Function) => {
      let result: number = testNapi.destroyParameters();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2000 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_2800
     * @tc.name      : 应用发布公共事件，发布带SetBoolArrayToParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API setBoolArrayToParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_2800', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setBoolArrayToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2800 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_2700
     * @tc.name      : 应用发布公共事件，发布带SetBoolToParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API setBoolToParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_2700', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setBoolToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2700 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_3000
     * @tc.name      : 应用发布公共事件，发布带SetCharArrayToParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API setCharArrayToParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_3000', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setCharArrayToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_3000 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_2900
     * @tc.name      : 应用发布公共事件，发布带SetCharToParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetCharToParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_2900', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setCharToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2900 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_2600
     * @tc.name      : 应用发布公共事件，发布带SetDoubleArrayToParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetDoubleArrayToParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_2600', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setCharToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2600 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_2500
     * @tc.name      : 应用发布公共事件，发布带SetDoubleToParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetDoubleToParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_2500', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setDoubleToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2500 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_2300
     * @tc.name      : 应用发布公共事件，发布带SetILongToParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API setLongToParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_2300', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setLongToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2300 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_2200
     * @tc.name      : 应用发布公共事件，发布带SetIntArrayToParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetIntArrayToParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_2200', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setIntArrayToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2200 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_2100
     * @tc.name      : 应用发布公共事件，发布带SetIntToParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetIntToParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_2100', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setIntToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2100 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_2400
     * @tc.name      : 应用发布公共事件，发布带SetLongArrayToParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetLongArrayToParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_2400', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setLongArrayToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2400 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_1400
     * @tc.name      : 应用发布公共事件，发布带SetPublishInfoBundleName的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetPublishInfoBundleName
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_1400', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setPublishInfoBundleName()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1400 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000)
      // 开发岳港解释无法获取
      // result = testNapi.getSetPublishInfoBundleName()
      // console.log(TAG+"Sub_Notification_Ces_CommonEvent_Pub_1400 "+result)
      // expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_1600
     * @tc.name      : 应用发布公共事件，发布带SetPublishInfoCode的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetPublishInfoCode
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_1600', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setPublishInfoCode()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1600 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getSetPublishInfoCode()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1600 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })



    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_1800
     * @tc.name      : 应用发布公共事件，发布带SetPublishInfoParameters的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetPublishInfoParameters
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_1800', Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1800 start" )
      let result: number = testNapi.setPublishInfoParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1800 11 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getSetPublishInfoParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1800 22 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_1500
     * @tc.name      : 应用发布公共事件，发布带SetPublishInfoPermissions的事件，有序公共事件的结果是否符合预期结果
     * @tc.desc      : C API SetPublishInfoPermissions
     * @tc.size      : Large-scaleTest
     * @tc.type      : Function test
     * @tc.level     : Level 2
    */
    it('Sub_Notification_Ces_CommonEvent_Pub_1500', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setPublishInfoPermissions()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1500 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /*
 * @tc.number    : Sub_Notification_Ces_CommonEvent_Pub_1700
 * @tc.name      : 应用发布公共事件，发布带SetPublishInfoData的事件，有序公共事件的结果是否符合预期结果
 * @tc.desc      : C API SetPublishInfoData
 * @tc.size      : Large-scaleTest
 * @tc.type      : Function test
 * @tc.level     : Level 2
*/
    it('Sub_Notification_Ces_CommonEvent_Pub_1700', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setPublishInfoData()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1700 " + result)
      expect(result === SUCCESS).assertTrue()
      await sleep(1000);
      result = testNapi.getSetPublishInfoData()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1700 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

  })

}