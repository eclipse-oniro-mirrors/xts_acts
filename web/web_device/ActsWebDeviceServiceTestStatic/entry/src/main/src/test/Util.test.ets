import events_emitter from '@ohos.events.emitter';
import { expect } from "../../../hypium/index";

export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async emitEvent(actualValue: boolean | string | number | object, eventId: number) {
    try {
      let tempData: Record<string, Object> = {};
      tempData['ACTION'] = actualValue;
      let backData: events_emitter.EventData = {
        data: tempData
      }

      let backEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.emit(backEvent, backData);
      console.info('Utils sleep start');
      await Utils.msSleep(2000)
      console.info('Finish emit, Utils sleep over');
    } catch (err) {
      console.info('webFlag emit action state err: ' + JSON.stringify(err));
    }
  }

  static registerBaseEvent(testCaseName: string, expected: Object, eventId: number,
    done: () => void, expectFunction: (backData: events_emitter.EventData, expected: Object) => void) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: events_emitter.EventData) => {
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expectFunction(backData, expected);
        } catch (err) {
          console.info(`[${testCaseName}] err:` + JSON.stringify(err));
        }
        done()
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(innerEvent, callBack)
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
  }

  static registerEvent(testCaseName: string, expectedValue: Object, eventId: number, done: () => void) {
    Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done, (backData: events_emitter.EventData, expected: Object) => {
      console.info(`Begin to assert [` + backData?.data?.['ACTION'] + `] Equal [` + expected + `]`);
      expect(backData?.data?.['ACTION']).assertEqual(expected);
    });
  }
}