import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libsubscribe.so';

let SUCCESS: number = 0;
let TAG:string = "ansTest"

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function commonEventCAPIPubTest() {

  describe('commonEventCAPIPubTest', (done: Function) => {
    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_0100
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_0100
     * @tc.desc   C API publish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_0100', Level.LEVEL0, (done: Function) => {
      let result: number = testNapi.publish();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0100 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_0200
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_0200
     * @tc.desc   C API publishWithInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_0200', Level.LEVEL0, (done: Function) => {
      let result: number = testNapi.publishWithInfo();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_0200 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_0300
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_0300
     * @tc.desc   C API publish ordered event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_0400
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_0400
     * @tc.desc   C API 发布FinishCommonEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_0500
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_0500
     * @tc.desc   C API 发布FinishCommonEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_0600
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_0600
     * @tc.desc   C API 发布GetAbortCommonEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_0700
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_0700
     * @tc.desc   C API ClearAbortCommonEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_0800
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_0800
     * @tc.desc   C API GetCodeFromSubscriber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_0900
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_0900
     * @tc.desc   C API SetCodeToSubscriber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_1000
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_1000
     * @tc.desc   C API GetDataFromSubscriber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_1100
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_1100
     * @tc.desc   C API SetDataToSubscriber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_1200
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_1200
     * @tc.desc   C API CreatePublishInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_1200', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.createPublishInfo();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1200 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })
    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_1300
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_1300
     * @tc.desc   C API DestroyPublishInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_1300', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.destroyParameters();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1300 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })


    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_1900
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_1900
     * @tc.desc   C API CreateParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_1900', Level.LEVEL1, async (done: Function) => {
      let result: number = testNapi.createParameters();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1900 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_2000
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_2000
     * @tc.desc   C API DestroyParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_2000', Level.LEVEL1, async (done: Function) => {
      let result: number = testNapi.destroyParameters();
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2000 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_2800
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_2800
     * @tc.desc   C API setBoolArrayToParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_2800', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setBoolArrayToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2800 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_2700
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_2700
     * @tc.desc   C API setBoolToParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_2700', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setBoolToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2700 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_3000
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_3000
     * @tc.desc   C API setCharArrayToParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_3000', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setCharArrayToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_3000 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_2900
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_2900
     * @tc.desc   C API SetCharToParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_2900', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setCharToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2900 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_2600
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_2600
     * @tc.desc   C API SetDoubleArrayToParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_2600', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setCharToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2600 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_2500
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_2500
     * @tc.desc   C API SetDoubleToParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_2500', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setDoubleToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2500 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_2300
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_2300
     * @tc.desc   C API setLongToParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_2300', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setLongToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2300 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_2200
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_2200
     * @tc.desc   C API SetIntArrayToParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_2200', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setIntArrayToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2200 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_2100
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_2100
     * @tc.desc   C API SetIntToParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_2100', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setIntToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2100 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_2400
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_2400
     * @tc.desc   C API SetLongArrayToParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_2400', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setLongArrayToParameters()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_2400 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_1400
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_1400
     * @tc.desc   C API SetPublishInfoBundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_1600
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_1600
     * @tc.desc   C API SetPublishInfoCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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



    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_1800
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_1800
     * @tc.desc   C API SetPublishInfoParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_1500
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_1500
     * @tc.desc   C API SetPublishInfoPermissions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_CommonEvent_Pub_1500', Level.LEVEL2, async (done: Function) => {
      let result: number = testNapi.setPublishInfoPermissions()
      console.log(TAG + "Sub_Notification_Ces_CommonEvent_Pub_1500 " + result)
      expect(result === SUCCESS).assertTrue()
      done();
    })

    /**
     * @tc.name   Sub_Notification_Ces_CommonEvent_Pub_1700
     * @tc.number Sub_Notification_Ces_CommonEvent_Pub_1700
     * @tc.desc   C API SetPublishInfoData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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