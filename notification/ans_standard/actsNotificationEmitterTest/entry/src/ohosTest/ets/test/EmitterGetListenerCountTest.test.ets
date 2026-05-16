import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import emitter from '@ohos.events.emitter';
import { util } from '@kit.ArkTS';

const TAG = 'NotificationActs';
const TEST_SUITE_NAME = 'testNotificationEmitterNotification';

function sleep(time: number){
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function emitterGetListenterCountTest() {
  describe('emitterGetListenterCountTest', () => {

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_0100
     * @tc.number Sub_Notification_Emitter_GetListenerCount_0100
     * @tc.desc   event字符串为1字符串&emit(eventData)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_0100', Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_0100';
      let eventId01 = 'E'
      let count = 0
      let onCallback01 : Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');

        let num: number = emitter.getListenerCount(eventId01)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');

      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(eventId01, onCallback01)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }

      emitter.emit(eventId01)
      await sleep(1000)
      emitter.off(eventId01, onCallback01)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_0200
     * @tc.number Sub_Notification_Emitter_GetListenerCount_0200
     * @tc.desc   event字符串为空字符串&emit(eventData)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_0200', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_0200';
      let eventId02 = ''
      let count = 0
      let onCallback02: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        count++
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');

      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.once(eventId02, onCallback02)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = emitter.getListenerCount(eventId02)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
      expect(num).assertEqual(undefined);
      emitter.emit(eventId02)
      expect(count).assertEqual(0);
      emitter.off(eventId02)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_0300
     * @tc.number Sub_Notification_Emitter_GetListenerCount_0300
     * @tc.desc   event字符串为10240字符串&emit(eventData)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_0300', Level.LEVEL2, async(done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_0300';
      let eventId03 = 'T'.repeat(10240)
      let count = 0
      let onCallback03: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        count++
        let num: number = emitter.getListenerCount(eventId03)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.once(eventId03, onCallback03)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }

      emitter.emit(eventId03)
      await sleep(1000)
      expect(count).assertEqual(1);
      emitter.off(eventId03)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_0400
     * @tc.number Sub_Notification_Emitter_GetListenerCount_0400
     * @tc.desc   event字符串为10241字符串&emit(eventData)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_0400', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_0400';
      let eventId04 : string = 'T'.repeat(10241)
      let eventId041 : string = 'T'.repeat(10240)
      let count = 0
      let onCallback04: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        count++
        let num: number = emitter.getListenerCount(eventId04)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(eventId04, onCallback04)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }

      emitter.emit(eventId041)
      await sleep(1000)
      expect(count).assertEqual(1);
      emitter.off(eventId04,onCallback04)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_0500
     * @tc.number Sub_Notification_Emitter_GetListenerCount_0500
     * @tc.desc   event字符串为1字符串&emit(GenericEventData)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_0500', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_0500';
      let eventId05 = 'E'
      let onConsume_number = 0
      let eventData = new SelfEventData();
      let onCallback05 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number +=1
        let num: number = emitter.getListenerCount(eventId05)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
        expect(num).assertEqual(1);
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(eventId05, onCallback05)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      emitter.emit(eventId05,eventData);
      await sleep(1000)
      expect(onConsume_number).assertEqual(1)
      emitter.off(eventId05)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_0600
     * @tc.number Sub_Notification_Emitter_GetListenerCount_0600
     * @tc.desc   event字符串为空字符串&emit(GenericEventData)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_0600', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_0600';
      let eventId06 = ''
      let onConsume_number = 0
      let onCallback06 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number += 1
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.once(eventId06, onCallback06)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = emitter.getListenerCount(eventId06)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
      expect(num).assertEqual(undefined);
      emitter.emit(eventId06);
      await sleep(1000)
      expect(onConsume_number).assertEqual(0)
      emitter.off(eventId06,onCallback06)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_0700
     * @tc.number Sub_Notification_Emitter_GetListenerCount_0700
     * @tc.desc   event字符串为10240字符串&emit(GenericEventData)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_0700', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_0700';
      let eventId07 = 'T'.repeat(10240)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' event07', JSON.stringify(eventId07));
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      }
      let onCallback07 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number += 1
        let num: number = emitter.getListenerCount(eventId07)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
        expect(num).assertEqual(1);
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.once(eventId07, onCallback07)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      emitter.emit(eventId07,eventData);
      await sleep(1000)
      expect(onConsume_number).assertEqual(1)
      emitter.off(eventId07,onCallback07)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_0800
     * @tc.number Sub_Notification_Emitter_GetListenerCount_0800
     * @tc.desc   event字符串为10241字符串&emit(GenericEventData)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_0800', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_0800';
      let eventId08 ='T'.repeat(10241)
      let eventId081 ='T'.repeat(10240)
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      }
      let onCallback08 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number += 1
        let num: number = emitter.getListenerCount(eventId08)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
        expect(num).assertEqual(1);
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(eventId08, onCallback08)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }

      emitter.emit(eventId081,eventData)
      await sleep(1000)
      expect(onConsume_number).assertEqual(1);
      emitter.off(eventId08)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_0900
     * @tc.number Sub_Notification_Emitter_GetListenerCount_0900
     * @tc.desc   event字符串为1字符串&emit(EventData,options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_0900', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_0900';
      let eventId09 ='R'
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let count = 0
      let onCallback09 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        count++
        let num: number = emitter.getListenerCount(eventId09)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num))
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(eventId09, onCallback09)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }

      emitter.emit(eventId09,options)
      await sleep(1000)
      expect(count).assertEqual(1);
      emitter.off(eventId09)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_1000
     * @tc.number Sub_Notification_Emitter_GetListenerCount_1000
     * @tc.desc   event字符串为空字符串&emit(EventData,options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_1000', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_1000';
      let eventId10 =''
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let count = 0
      let onCallback10: Callback<emitter.EventData> = (eventData: emitter.EventData) : void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        count++
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.once(eventId10, onCallback10)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = emitter.getListenerCount(eventId10)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num))
      expect(num).assertEqual(undefined);
      emitter.emit(eventId10,options)
      await sleep(1000)
      expect(count).assertEqual(0);
      emitter.off(eventId10,onCallback10)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_1100
     * @tc.number Sub_Notification_Emitter_GetListenerCount_1100
     * @tc.desc   event字符串为10240字符串&emit(EventData,options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_1100', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_1100';
      let eventId11 ='E'.repeat(10240)
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let onCallback11 : Callback<emitter.EventData> = (eventData: emitter.EventData) : void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        let num: number = emitter.getListenerCount(eventId11)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num))
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.once(eventId11, onCallback11)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      emitter.emit(eventId11,options)
      await sleep(1000)
      emitter.off(eventId11,onCallback11)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_1200
     * @tc.number Sub_Notification_Emitter_GetListenerCount_1200
     * @tc.desc   event字符串为10241字符串&emit(EventData,options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_1200', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_1200';
      let eventId12 ='E'.repeat(10241)
      let eventId121 ='E'.repeat(10240)
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let onCallback12 : Callback<emitter.EventData> = (eventData: emitter.EventData) : void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        let num: number = emitter.getListenerCount(eventId12)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num))
        expect(num).assertEqual(1);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.once(eventId12, onCallback12)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }

      emitter.emit(eventId121,options)
      await sleep(1000)
      emitter.off(eventId12,onCallback12)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_1300
     * @tc.number Sub_Notification_Emitter_GetListenerCount_1300
     * @tc.desc   event字符串为1字符串&emit(GenericEventData,options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_1300', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_1300';
      let eventId13 = 'T'
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      }
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let onCallback13 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number += 1
        let num: number = emitter.getListenerCount(eventId13)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
        expect(num).assertEqual(1);
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(eventId13, onCallback13)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      emitter.emit(eventId13,options,eventData);
      await sleep(1000)
      expect(onConsume_number).assertEqual(1)
      emitter.off(eventId13,onCallback13)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_1400
     * @tc.number Sub_Notification_Emitter_GetListenerCount_1400
     * @tc.desc   event字符串为空字符串&emit(GenericEventData,options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_1400', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_1400';
      let eventId14 = ''
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      }
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let onCallback14 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number += 1

      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(eventId14, onCallback14)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      let num: number = emitter.getListenerCount(eventId14)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
      expect(num).assertEqual(undefined);
      emitter.emit(eventId14,options,eventData);
      await sleep(1000)
      expect(onConsume_number).assertEqual(0)
      emitter.off(eventId14,onCallback14)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_1500
     * @tc.number Sub_Notification_Emitter_GetListenerCount_1500
     * @tc.desc   event字符串为10240字符串&emit(GenericEventData,options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_1500', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_1500';
      let eventId15 = 'T'.repeat(10240)
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      }
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let onCallback15 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number += 1
        let num: number = emitter.getListenerCount(eventId15)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
        expect(num).assertEqual(1);
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.once(eventId15, onCallback15)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }

      emitter.emit(eventId15,options,eventData);
      await sleep(1000)
      expect(onConsume_number).assertEqual(1)
      emitter.off(eventId15)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_GetListenerCount_1600
     * @tc.number Sub_Notification_Emitter_GetListenerCount_1600
     * @tc.desc   event字符串为10241字符串&emit(GenericEventData,options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_GetListenerCount_1600', Level.LEVEL2,async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_GetListenerCount_1600';
      let eventId16 = 'T'.repeat(10241)
      let eventId161 = 'T'.repeat(10240)
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      }
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      let onCallback16 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number += 1
        let num: number = emitter.getListenerCount(eventId16)
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` getListenerCount success,data is %{public}s`, JSON.stringify(num));
        expect(num).assertEqual(1);
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.once(eventId16, onCallback16)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }

      emitter.emit(eventId161,options,eventData);
      await sleep(1000)
      expect(onConsume_number).assertEqual(1)
      emitter.off(eventId16,onCallback16)
      hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      done();
    })
  })
}

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