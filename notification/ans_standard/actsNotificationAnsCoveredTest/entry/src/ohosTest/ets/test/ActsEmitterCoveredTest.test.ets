import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '@ohos/hypium';
import Base from '@ohos.base';
import { BusinessError } from '@kit.BasicServicesKit';
import emitter from '@ohos.events.emitter';

@Sendable
class Sample {
  constructor() {
    this.count = 100;
  }
  printCount() {
    console.info('Print count : ' + this.count);
  }
  count: number;
}
class SelfEventData implements emitter.EventData {
  data: Sample = new Sample();
}
async function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}
let eventData: emitter.EventData = {
  data: {
    "content": "content",
    "id": 1,
  }
};

let emitter1 = new emitter.Emitter()
const TAG = 'Notification';
const TEST_SUITE_NAME = 'ActsEmitterTest'

export default function actsEmitterCovered() {
  describe('actsEmitterCovered', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })



      /**
       * @tc.name   Sub_Notification_Emitter_Capabilities_0100
       * @tc.number Sub_Notification_Emitter_Capabilities_0100
       * @tc.desc   test on interface success
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Emitter_Capabilities_0100', Level.LEVEL2, (done: Function) => {
        const TAG = 'Sub_Notification_Emitter_Capabilities_0100';

        let onCallback :Callback<emitter.EventData> = (eventData: emitter.EventData)=> {
          console.info(TAG+ ' on success');
          expect(false).assertTrue();
          console.info(TAG+ ' test case end');
          done();
        }
        try {
          console.info(TAG+ ' test case start');
          emitter.on(undefined, onCallback)
        } catch (err) {
          console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
          expect(false).assertTrue();
          console.info(TAG+ ' test case end');
          done();
        }
        try{
          console.info(TAG+ 'off callback begin');
          emitter.off(undefined);
          console.info(TAG+ 'off callback success');
        }catch(err){
          console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
        try{
          emitter.emit(undefined,undefined,eventData);
          console.info(TAG+ ' emit event success');
          done();
        }catch(err){
          console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
        console.info(TAG+ ' test case end');
        done();
      })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0200
     * @tc.number Sub_Notification_Emitter_Capabilities_0200
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0200', Level.LEVEL2,async (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_0200';
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let onCallback05 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number +=1
      }
      try {
        console.info(TAG+ ' test case start');
        emitter.on('', onCallback05)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter.emit('',eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off('', onCallback05);
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0300
     * @tc.number Sub_Notification_Emitter_Capabilities_0300
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0300', Level.LEVEL2,async (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_0300';
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let onCallback05 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number +=1
      }
      try {
        console.info(TAG+ ' test case start');
        emitter.on(null, onCallback05)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter.emit(null,eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off(null, onCallback05);
        emitter.off(null)
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0400
     * @tc.number Sub_Notification_Emitter_Capabilities_0400
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0400', Level.LEVEL2,async (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_0400';
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let onCallback05 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number +=1
      }
      try {
        console.info(TAG+ ' test case start');
        emitter.on(undefined, onCallback05)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter.emit(undefined,eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off(undefined, onCallback05);
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0500
     * @tc.number Sub_Notification_Emitter_Capabilities_0500
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0500', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_0500'
      let callback01:Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback02 success');
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once('', callback01);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off('', callback01);
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit('',eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0600
     * @tc.number Sub_Notification_Emitter_Capabilities_0600
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0600', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_0600'
      let callback02:Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback02 success');
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(null, callback02);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off(null, callback02);
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(null,eventData);
        console.info(TAG+ ' emit event success');
        expect(emitter.getListenerCount(null)).assertEqual(undefined)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0700
     * @tc.number Sub_Notification_Emitter_Capabilities_0700
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0700', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_0700'
      let callback03:Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback02 success');
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(undefined, callback03);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off(undefined, callback03);
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(undefined,eventData);
        console.info(TAG+ ' emit event success');
        expect(emitter.getListenerCount(undefined)).assertEqual(undefined)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0800
     * @tc.number Sub_Notification_Emitter_Capabilities_0800
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0800', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_0800'
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let option: emitter.Options = {
        priority: 0
      }
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once('', callback);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit('',option,eventData);
        console.info(TAG+ ' emit event success');
        emitter.off('')
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0900
     * @tc.number Sub_Notification_Emitter_Capabilities_0900
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0900', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_0900'
      let option: emitter.Options = {
        priority: 0
      }
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(null, callback);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(null,null,eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_1000
     * @tc.number Sub_Notification_Emitter_Capabilities_1000
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_1000', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_1000'
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(undefined, callback);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(undefined,undefined,eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_1100
     * @tc.number Sub_Notification_Emitter_Capabilities_1100
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_1100', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_1100';

      let count :number = 0
      let innerEvent1: emitter.InnerEvent = {
        eventId: 1,
        priority: emitter.EventPriority.HIGH
      }
      let innerEvent2: emitter.InnerEvent = {
        eventId: 2,
        priority: emitter.EventPriority.LOW
      }
      let innerEvent3: emitter.InnerEvent = {
        eventId: 2,
        priority: emitter.EventPriority.IDLE
      }
      let innerEvent4: emitter.InnerEvent = {
        eventId: 2,
        priority: emitter.EventPriority.IMMEDIATE
      }
      let onCallback1 :Callback<emitter.EventData> = (eventData: emitter.EventData)=>{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        count++
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(innerEvent1, onCallback1)
        emitter.on(innerEvent2, onCallback1)
        emitter.on(innerEvent3, onCallback1)
        emitter.on(innerEvent4, onCallback1)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        emitter.emit(innerEvent1,eventData)
        emitter.emit(innerEvent2,eventData)
        emitter.emit(innerEvent3,eventData)
        emitter.emit(innerEvent4,eventData)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      setTimeout(() => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
        expect(count).assertEqual(4);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_1400
     * @tc.number Sub_Notification_Emitter_Capabilities_1400
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_1400', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_1400';
      let option: emitter.Options = {
        priority: 0
      }
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let onCallback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.on("", onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit("",eventData);
        console.info(TAG+ ' emit event success');
        emitter1.emit("",option,eventData);
        console.info(TAG+ ' emit event success');
        emitter1.off('',onCallback)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_1500
     * @tc.number Sub_Notification_Emitter_Capabilities_1500
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_1500', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_1500';
      let option: emitter.Options = {
        priority: 0
      }
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let onCallback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.on(null, onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit(null,eventData);
        console.info(TAG+ ' emit event success');
        emitter1.emit('event',option,null);
        console.info(TAG+ ' emit event success');
        emitter1.off(null,onCallback)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_1600
     * @tc.number Sub_Notification_Emitter_Capabilities_1600
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_1600', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_1600';
      let option: emitter.Options = {
        priority: 0
      }
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let onCallback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.on(undefined, onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit(undefined,eventData);
        console.info(TAG+ ' emit event success');
        emitter1.emit('event',option,undefined);
        console.info(TAG+ ' emit event success');
        emitter1.off(undefined,onCallback)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_1700
     * @tc.number Sub_Notification_Emitter_Capabilities_1700
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_1700', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_1700';
      let option: emitter.Options = {
        priority: 0
      }
      let onCallback: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);

      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.on('', onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit('',eventData);
        console.info(TAG+ ' emit event success');
        emitter1.emit('',option,eventData);
        console.info(TAG+ ' emit event success');
        emitter1.off('',onCallback)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_1800
     * @tc.number Sub_Notification_Emitter_Capabilities_1800
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_1800', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_1800';
      let option: emitter.Options = {
        priority: 0
      }
      let onCallback: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);

      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.on(null, onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit(null,eventData);
        console.info(TAG+ ' emit event success');
        emitter1.emit(null,option,eventData);
        console.info(TAG+ ' emit event success');
        emitter1.off(null,onCallback)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_1900
     * @tc.number Sub_Notification_Emitter_Capabilities_1900
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_1900', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_1900';
      let option: emitter.Options = {
        priority: 0
      }
      let onCallback: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);

      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.on(undefined, onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit(undefined,eventData);
        console.info(TAG+ ' emit event success');
        emitter1.emit(undefined,option,eventData);
        console.info(TAG+ ' emit event success');
        emitter1.off(undefined,onCallback)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_2000
     * @tc.number Sub_Notification_Emitter_Capabilities_2000
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_2000', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_2000';
      let option: emitter.Options = {
        priority: 0
      }
      let onCallback: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);

      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.once('', onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit('event',eventData);
        console.info(TAG+ ' emit event success');
        emitter1.emit('event',option, eventData);
        console.info(TAG+ ' emit event success');
        emitter1.off('')
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_2100
     * @tc.number Sub_Notification_Emitter_Capabilities_2100
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_2100', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_2100';
      let option: emitter.Options = {
        priority: 0
      }
      let onCallback: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);

      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.once(null, onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit('event',null);
        console.info(TAG+ ' emit event success');
        emitter1.emit('event',option,null);
        console.info(TAG+ ' emit event success');
        emitter1.off(null)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_2200
     * @tc.number Sub_Notification_Emitter_Capabilities_2200
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_2200', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_2200';
      let option: emitter.Options = {
        priority: 0
      }
      let onCallback: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);

      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.once(undefined, onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit('event',undefined);
        console.info(TAG+ ' emit event success');
        emitter1.emit('event',option,undefined);
        console.info(TAG+ ' emit event success');
        emitter1.off(undefined)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })


    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_2300
     * @tc.number Sub_Notification_Emitter_Capabilities_2300
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_2300', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_2300';
      let option: emitter.Options = {
        priority: 0
      }
      let onCallback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.once('', onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit('event',eventData);
        console.info(TAG+ ' emit event success');
        emitter1.emit('event',option,eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_2400
     * @tc.number Sub_Notification_Emitter_Capabilities_2400
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_2400', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_2400';
      let option: emitter.Options = {
        priority: 0
      }
      let onCallback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.once(null, onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit('event',null);
        console.info(TAG+ ' emit event success');
        emitter1.emit('event',option,null);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_2500
     * @tc.number Sub_Notification_Emitter_Capabilities_2500
     * @tc.desc   test  NEW EMITTER interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_2500', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_2500';
      let option: emitter.Options = {
        priority: 0
      }
      let onCallback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try {
        console.info(TAG+ ' test case start');
        emitter1.once(undefined, onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter1.emit('event',undefined);
        console.info(TAG+ ' emit event success');
        emitter1.emit('event',option,undefined);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })
    
    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_2600
     * @tc.number Sub_Notification_Emitter_Capabilities_2600
     * @tc.desc   test  off interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_2600', Level.LEVEL2, (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_2600';
      let innerEvent: emitter.InnerEvent = {
        eventId: 1
      };

      let onCallback: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        expect(false).assertTrue();
      }
      try {
        console.info(TAG+ ' test case start');
        emitter.on(innerEvent, onCallback)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter.off(undefined);
        emitter.off(null);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })
  })
}
