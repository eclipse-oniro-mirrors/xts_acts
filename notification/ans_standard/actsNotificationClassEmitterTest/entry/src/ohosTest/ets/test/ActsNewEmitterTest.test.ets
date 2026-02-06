import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe,it, expect, Level,afterEach } from '@ohos/hypium';
import { emitter, Callback } from '@kit.BasicServicesKit';


let emitter1 = new emitter.Emitter();
let emitter2 = new emitter.Emitter();
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

@Sendable
class Sample1 {
  constructor() {
    this.count = 120;
  }
  printCount() {
    console.info('Print count : ' + this.count);
  }
  count: number;
}
async function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}
export default function ActsNewEmitterTest() {
  describe('ActsNewEmitterTest', () => {
    afterEach(async ()=> {
       await sleep(2000)
    })

   /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_0100
     * @tc.name    Sub_Notification_Class_Emitter_Emit_0100
     * @tc.desc    test on interface success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('Sub_Notification_Class_Emitter_Emit_0100', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_0100';
      let count: number = 0;
      let count1: number = 0;
      let eventData: emitter.EventData = {
        data: {
          content: 'event',
          id: 1
        }
      }
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000,TEST_CASE_NAME,`callback eventData success: ${JSON.stringify(eventData)}`);
        count++;
      }
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000,TEST_CASE_NAME,`callback eventData success: ${JSON.stringify(eventData)}`);
        count1++;
      }
      try{
        hilog.info(0x001, TEST_CASE_NAME,'test case begin');
        emitter1.on("event", callback);
      }catch(err){
        hilog.info(0x001,'on failed,data is: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
      try{
        hilog.info(0x001,TEST_CASE_NAME,'test case begin');
        emitter2.on("event", callback1);
      }catch(err){
        hilog.info(0x001,'on failed,data is: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
      try{
        hilog.info(0x001, TEST_CASE_NAME,'test emit1 success');
        emitter1.emit("event",eventData);
        await sleep(3000);
      }catch(err){
        hilog.info(0x001,'on failed,data is: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
      try{
        hilog.info(0x001, TEST_CASE_NAME,'test emit2 success');
        emitter2.emit("event",eventData);
        await sleep(3000);
      }catch(err){
        hilog.info(0x001,'on failed,data is: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
      await sleep(3000);
      expect(count).assertEqual(1);
      expect(count1).assertEqual(1);
      emitter1.off("event");
      emitter2.off("event");
      done();
    })

   /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_0200
     * @tc.name    Sub_Notification_Class_Emitter_Emit_0200
     * @tc.desc    test on interface success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('Sub_Notification_Class_Emitter_Emit_0200', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_0200';
      let count: number = 0;
      let count1: number = 0;
      let eventDataT: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let callbackT: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        hilog.info(0x0000,TEST_CASE_NAME,`callbackT emitter genericEventData: ${JSON.stringify(eventData.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
          count++;
        }
      }
      let callbackT1: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        hilog.info(0x0000,TEST_CASE_NAME,`callbackT emitter genericEventData: ${JSON.stringify(eventData.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
          count1++;
        }
      }
      try{
        hilog.info(0x001, TEST_CASE_NAME,'test case begin');
        emitter1.on("event", callbackT);
      }catch(err){
        hilog.info(0x001,'on failed,data is: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
      try{
        hilog.info(0x001, TEST_CASE_NAME,'test case begin');
        emitter2.on("event", callbackT1);
      }catch(err){
        hilog.info(0x001,'on failed,data is: ', JSON.stringify(err));
        expect().assertFail();
        done();
      }
      try{
        hilog.info(0x001, TEST_CASE_NAME,'test emit success');
        emitter1.emit("event",eventDataT);
        await sleep(3000);
      }catch(err){
        hilog.info(0x0000, 'testTag',
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      try{
        hilog.info(0x001,TEST_CASE_NAME,'test emit success');
        emitter2.emit("event",eventDataT);
        await sleep(3000);
      }catch(err){
        hilog.info(0x0000, 'testTag',
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      await sleep(3000);
      expect(count).assertEqual(1);
      expect(count1).assertEqual(1);
      emitter1.off("event");
      emitter2.off("event");
      done();
    })

   /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_0300
     * @tc.name    Sub_Notification_Class_Emitter_Emit_0300
     * @tc.desc    test once interface success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('Sub_Notification_Class_Emitter_Emit_0300', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_0300';
      let eventData: emitter.EventData = {
        data: {
          content: 'eventOnce',
          id: 1
        }
      }
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000,TEST_CASE_NAME,`callback eventData success: ${JSON.stringify(eventData)}`);
      }
      try {
        hilog.info(0x001,TEST_CASE_NAME,'test case start');
        emitter1.once("eventOnce", callback);
      } catch (err) {
        hilog.info(0x0000, TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      try {
        hilog.info(0x001,TEST_CASE_NAME,'test case start');
        emitter2.once("eventOnce", callback);
      } catch (err) {
        hilog.info(0x0000, TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      try {
        hilog.info(0x001,TEST_CASE_NAME ,'emit success');
        emitter1.emit("eventOnce",eventData);
        await sleep(3000);
      } catch (err) {
        hilog.info(0x0000,TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      try {
        hilog.info(0x001,TEST_CASE_NAME ,'emit success');
        emitter2.emit("eventOnce",eventData);
        await sleep(3000);
      } catch (err) {
        hilog.info(0x0000, TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      await sleep(3000);
      let num: number = emitter1.getListenerCount("eventOnce");
      let num1: number = emitter2.getListenerCount("eventOnce");
      hilog.info(0x000,TEST_CASE_NAME,`getListenerCount success:${JSON.stringify(num)}`);
      expect(num).assertEqual(0);
      expect(num1).assertEqual(0);
      hilog.info(0x000,TEST_CASE_NAME, 'test case end');
      emitter1.off("eventOnce");
      emitter2.off("eventOnce");
      done();
    })

   /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_0400
     * @tc.name    Sub_Notification_Class_Emitter_Emit_0400
     * @tc.desc    test once interface success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('Sub_Notification_Class_Emitter_Emit_0400', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_0400';
      let eventDataT: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let callbackT: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        hilog.info(0x0000,TEST_CASE_NAME,`callbackT emitter genericEventData: ${JSON.stringify(eventData.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try {
        hilog.info(0x001,TEST_CASE_NAME,'test case start');
        emitter1.once("eventOnce", callbackT);
      } catch (err) {
        hilog.info(0x0000, TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      try {
        hilog.info(0x001,TEST_CASE_NAME,'test case start');
        emitter2.once("eventOnce", callbackT);
      } catch (err) {
        hilog.info(0x0000,TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      try {
        hilog.info(0x001,TEST_CASE_NAME ,'emit success');
        emitter1.emit("eventOnce",eventDataT);
        await sleep(3000);
      } catch (err) {
        hilog.info(0x0000,TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      try {
        hilog.info(0x001,TEST_CASE_NAME ,'emit success');
        emitter2.emit("eventOnce",eventDataT);
        await sleep(3000);
      } catch (err) {
        hilog.info(0x0000,TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      await sleep(3000);
      let num: number = emitter1.getListenerCount("eventOnce");
      let num1: number = emitter2.getListenerCount("eventOnce");
      hilog.info(0x000,TEST_CASE_NAME,`getListenerCount success: ${JSON.stringify(num)}`);
      expect(num).assertEqual(0);
      expect(num1).assertEqual(0);
      hilog.info(0x000,TEST_CASE_NAME, 'test case end');
      emitter1.off("eventOnce");
      emitter2.off("eventOnce");
      done();
    })

   /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_0500
     * @tc.name    Sub_Notification_Class_Emitter_Emit_0500
     * @tc.desc    test getListenerCount success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('Sub_Notification_Class_Emitter_Emit_0500', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_0500';
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000,TEST_CASE_NAME,`callback eventData success: ${JSON.stringify(eventData)}`);
      }
      let callback1: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000,TEST_CASE_NAME,`callback eventData success: ${JSON.stringify(eventData)}`);
      }
      let callback2: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000,TEST_CASE_NAME,`callback eventData success: ${JSON.stringify(eventData)}`);
      }
      let callback3: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000,TEST_CASE_NAME,`callback eventData success: ${JSON.stringify(eventData)}`);
      }
      let callback4: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000,TEST_CASE_NAME,`callback eventData success: ${JSON.stringify(eventData)}`);
      }

      try{
        hilog.info(0x001, TEST_CASE_NAME,'test case begin');
        emitter1.on("event1",callback);
        emitter1.on("event1",callback1);
        emitter1.on("event1",callback2);
        emitter1.on("event1",callback3);
        emitter1.on("event1",callback4);
        emitter2.on("event1",callback);
        emitter2.on("event1",callback1);
      }catch(err){
        hilog.info(0x0000,TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      try{
        hilog.info(0x001,TEST_CASE_NAME,'off success');
        emitter1.off("event1",callback);
        emitter1.off("event1",callback1);
        emitter2.off("event1",callback1);
      }catch(err){
        hilog.info(0x0000,TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      let num1: number = emitter1.getListenerCount("event1");
      let num2: number = emitter2.getListenerCount("event1");
      hilog.info(0x000,TEST_CASE_NAME,`getListenerCount success:${JSON.stringify(num1)}`);
      expect(num1).assertEqual(3);
      expect(num2).assertEqual(1);
      hilog.info(0x000,TEST_CASE_NAME, 'test case end');
      done();
    })

   /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_0600
     * @tc.name    Sub_Notification_Class_Emitter_Emit_0600
     * @tc.desc    off(eventId: string): void
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('Sub_Notification_Class_Emitter_Emit_0600', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_0600';
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000,TEST_CASE_NAME,`callback eventData success: ${JSON.stringify(eventData)}`);
      }
      try{
        hilog.info(0x001,TEST_CASE_NAME,'test case begin');
        emitter1.on("event1",callback);
        emitter2.on("event1",callback);
      }catch(err){
        hilog.info(0x0000,TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }
      try{
        emitter1.off("event1");
        emitter2.off("event1");
        hilog.info(0x0000, TEST_CASE_NAME, 'emitter1 off success!');
      }catch(err){
        hilog.info(0x0000, TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }

      let num: number = emitter1.getListenerCount("event1");
      hilog.info(0x000,
       TEST_CASE_NAME,`getListenerCount success:${JSON.stringify(num)}`);
      expect(num).assertEqual(0);
      let num2: number = emitter2.getListenerCount("event1");
      hilog.info(0x000,
        TEST_CASE_NAME, `getListenerCount success: ${JSON.stringify(num2)}`);
      expect(num2).assertEqual(0);
      done();
    })

   /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_0700
     * @tc.name    Sub_Notification_Class_Emitter_Emit_0700
     * @tc.desc    off(eventId: string, callback: Callback<EventData>): void
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('Sub_Notification_Class_Emitter_Emit_0700', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_0700';
      let callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x0000,TEST_CASE_NAME,`callback eventData success: ${JSON.stringify(eventData)}`);
      }
      let eventData: emitter.EventData = {
        data: {
          content: 'event1',
          id: 1
        }
      }
      try{
        hilog.info(0x001,TEST_CASE_NAME,'test case begin');
        emitter1.on("event1",callback);
        emitter2.on("event2",callback);
      }catch(err){
        hilog.info(0x0000,TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }

      try{
        emitter1.off("event1",callback);
        emitter2.off("event2",callback);
        hilog.info(0x0000, TEST_CASE_NAME, 'emitter1 off success!');
      }catch(err){
        hilog.info(0x0000, TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }

      let num: number = emitter1.getListenerCount("event1");
      hilog.info(0x000,
        TEST_CASE_NAME,`getListenerCount success: ${JSON.stringify(num)}`);
      expect(num).assertEqual(0);
      let num2: number = emitter2.getListenerCount("event2");
      hilog.info(0x000, TEST_CASE_NAME,`getListenerCount success: ${JSON.stringify(num2)}`);
      expect(num2).assertEqual(0);
      done();
    })

   /**
     * @tc.number  Sub_Notification_Class_Emitter_Emit_0800
     * @tc.name    Sub_Notification_Class_Emitter_Emit_0800
     * @tc.desc    off<T>(eventId: string, callback: Callback<GenericEventData<T>>): void
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('Sub_Notification_Class_Emitter_Emit_0800', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Class_Emitter_Emit_0800';
      let eventDataT: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let callbackT: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        hilog.info(0x0000,TEST_CASE_NAME,`callbackT emitter genericEventData: ${JSON.stringify(eventData.data)}`);
      }
      try{
        hilog.info(0x001, TEST_CASE_NAME,'test case begin');
        emitter1.on("event1",callbackT);
        emitter2.on("event2",callbackT);
      }catch(err){
        hilog.info(0x0000,TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }

      try{
        emitter1.off("event1",callbackT);
        emitter2.off("event2",callbackT);
        hilog.info(0x0000, TEST_CASE_NAME, 'emitter1 off success!');
      }catch(err){
        hilog.info(0x0000, TEST_CASE_NAME,
          `emitter1.emit failed, error.code: ${err.code}, error.message: ${err.message}`);
        expect().assertFail();
        done();
      }

      let num: number = emitter1.getListenerCount("event1");
      hilog.info(0x000, TEST_CASE_NAME,`getListenerCount success: ${JSON.stringify(num)}`);
      expect(num).assertEqual(0);
      let num2: number = emitter2.getListenerCount("event2");
      hilog.info(0x000, TEST_CASE_NAME,`getListenerCount success: ${JSON.stringify(num2)}`);
      expect(num2).assertEqual(0);
      done();
    })
  })
}