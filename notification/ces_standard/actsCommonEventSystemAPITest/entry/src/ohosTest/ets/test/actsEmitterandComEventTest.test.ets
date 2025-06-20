/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, Level } from '@ohos/hypium';
import {BusinessError} from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';
let TAG: string = 'testToc';
// 时延设置
function sleep(time: number){
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}
let subscriber:commonEventManager.CommonEventSubscriber; //用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
function publishCB(err: BusinessError) {
  if (err) {
    console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`);
    expect(err.code).assertEqual(0)
    done()
  } else {
    console.info(TAG+"publish Success");
  }
}
//取消订阅公共事件回调
function unsubscribeCB(err: BusinessError) {
  if (err) {
    console.error(TAG+`unsubscribe failed, code is ${err.code}, message is ${err.message}`);
    expect(err.code).assertEqual(0)
    done()
  } else {
    console.info(TAG+"unsubscribe Success");
  }
}
//有序公共事件
let subscriber_a: commonEventManager.CommonEventSubscriber;
let subscriber_b: commonEventManager.CommonEventSubscriber;

export default function actsEmitterandComEventTest() {
  let TAG: string = 'testToc';
  const DOMAIN_NUMBER: number = 0xFF00;
  describe('actsEmitterandComEventTest', () => {
    /**
     * @tc.number     : Sub_NotificationAns_Emitter_Basic_0001
     * @tc.name       : 持续订阅-发布2次-两次都能收到订阅回调-取消订阅成功
     * @tc.desc       : 事件基本功能用例
     * @tc.size       : MediumTest
     * @tc.type       : Function test
     * @tc.level      : Level 0
     */
    it('Sub_NotificationAns_Emitter_Basic_0001', Level.LEVEL0, async (done: Function) => {
      // 调用持续订阅指定事件接口
      let result = 0
      emitter.on("eventId1", () => {
        console.info(TAG+'callback success'+result); //第二个参数就是订阅回调的函数，回调成功才会打印
        result += 1
        return result
      });
      await sleep(100)
      //调用发送指定事件接口
      let eventData: emitter.EventData = {
        data: {
          "content": "c",
          "id": 1,
        }
      };
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      await sleep(100)
      console.info(TAG+'emitterEmit success');
      //调用取消订阅事件接口
      emitter.off("eventId1");
      await sleep(100)
      console.info(TAG+'emitterOff success');
      expect(result).assertEqual(2)
      hilog.info(DOMAIN_NUMBER, TAG, 'Sub_NotificationAns_Emitter_Basic_0001 PASS');
      done()
    })
    /**
     * @tc.number     : Sub_NotificationAns_Emitter_Basic_0002
     * @tc.name       : 单次订阅-发布2次-仅第一次能收到订阅回调-取消订阅成功
     * @tc.desc       : 事件基本功能用例
     * @tc.size       : Medium-sized test
     * @tc.type       : Function test
     * @tc.level      : Level 0
     */
    it('Sub_NotificationAns_Emitter_Basic_0002', Level.LEVEL0, async (done: Function) => {
      let eventData: emitter.EventData = {
        data: {
          "content": "c",
          "id": 1,
        }
      };
      let onConsume_number = 0
      let emit_number = 0
      emitter.once("eventId2", () => {
        console.info(TAG+'once callback success'+onConsume_number);
        onConsume_number += 1
        return onConsume_number
      });
      await sleep(100)
      emitter.emit("eventId2", eventData);
      console.info(TAG+'emitterEmit success'+emit_number);
      await sleep(100) //napi异步处理局限，极限情况下会出现订阅返回2次，加等待即可
      emit_number += 1
      emitter.emit("eventId2", eventData);
      console.info(TAG+'emitterEmit success'+emit_number);
      //调用取消订阅事件接口
      await sleep(2000)
      emitter.off("eventId2");
      console.info(TAG+'emitterOff success');
      await sleep(100)
      expect(onConsume_number).assertEqual(1)
      hilog.info(DOMAIN_NUMBER, TAG, 'Sub_NotificationAns_Emitter_Basic_0002 PASS');
      done()
    })
    /**
     * @tc.number     : Sub_NotificationAns_CommonEvent_Basic_0001
     * @tc.name       : 公共事件订阅-发布-检查订阅回调-取消订阅基本功能正常
     * @tc.desc       : 公共事件基础用例验证
     * @tc.size       : Medium-sized test
     * @tc.type       : Function test
     * @tc.level      : Level 0
     */
    it('Sub_NotificationAns_CommonEvent_Basic_0001', Level.LEVEL0, async (done: Function) => {
      let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
        events: ["event"]
      };
      //调用commonEventManager.subscribe接口，以回调形式订阅公共事件
      //创建订阅者
      try {
        commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          if (!err) {
            console.info(TAG + "createSubscriber success");
            subscriber = commonEventSubscriber;
            //订阅公共事件
            try {
              commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
                if (err) {
                  console.error(TAG + `subscribe failed, code is err.code,messageis{err.code}, message is {err.message}`);
                  expect(err.code).assertEqual(0)
                  done()
                } else {
                  console.info(TAG + "subscribe success");
                  console.info(TAG + "Consume callback " + JSON.stringify(data));
                  let event = data == undefined ? 0 : data.event;
                  expect(event).assertEqual("event")
                }
              });
            } catch (error) {
              let err: BusinessError = error as BusinessError;
              console.error(TAG + `subscribe failed, code is err.code,messageis{err.code}, message is {err.message}`);
            }
          } else {
            console.error(TAG + `createSubscriber failed, code is err.code,messageis{err.code}, message is {err.message}`);
          }
        });
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(TAG + `createSubscriber failed, code is err.code,messageis{err.code}, message is {err.message}`);
      }
      await sleep(100)
      //调用commonEventManager.publish接口，发布公共事件
      try {
        commonEventManager.publish("event", publishCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`);
      }
      await sleep(1000)
      //调用commonEventManager.unsubscribe接口，回调形式取消订阅公共事件
      try {
        commonEventManager.unsubscribe(subscriber, unsubscribeCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(TAG+`unsubscribe failed, code is ${err.code}, message is ${err.message}`);
      }
      hilog.info(DOMAIN_NUMBER, TAG, 'Sub_NotificationAns_CommonEvent_Basic_0001 PASS');
      done()
    })
    /**
     * @tc.number     : Sub_NotificationAns_CommonEvent_Basic_0002
     * @tc.name       : 有序公共事件订阅-发布-检查订阅回调-取消订阅基本功能正常（finishCommonEvent）
     * @tc.desc       : 公共事件基础用例验证
     * @tc.size       : Medium-sized test
     * @tc.type       : Function test
     * @tc.level      : Level 0
     */
    it('Sub_NotificationAns_CommonEvent_Basic_0002', Level.LEVEL0, async (done: Function) => {
      //订阅者a，优先级为1
      let subscribeInfo_a: commonEventManager.CommonEventSubscribeInfo = {
        events: ["event11"],
        priority: 1
      };
      try {
        commonEventManager.createSubscriber(subscribeInfo_a, (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          if (!err) {
            console.info(TAG + "订阅者a createSubscriber success");
            subscriber_a = commonEventSubscriber;
            try {
              commonEventManager.subscribe(subscriber_a, (err: BusinessError, data_a: commonEventManager.CommonEventData) => {
                if (err) {
                  console.error(TAG + `订阅者a subscribe failed, code is ${err.code}, message is ${err.message}`);
                } else {
                  console.info(TAG + "订阅者a subscribe success");
                  console.info(TAG + "订阅者a Consume callback " + JSON.stringify(data_a));
                  let event_a = data_a == undefined ? 0 : data_a.event;
                  expect(event_a).assertEqual("event11")
                  // 结束订阅者对当前有序公共事件处理的回调
                  subscriber_a.finishCommonEvent((err: BusinessError)=> {
                    if (err != null) {
                      console.error(TAG +`订阅者a finishCommonEvent failed, code is ${err.code}, message is ${err.message}`);
                    } else {
                      console.info(TAG +"订阅者a finishCommonEvent success");
                    }
                  });
                  //取消订阅
                  //取消订阅a
                  try {
                    commonEventManager.unsubscribe(subscriber_a, unsubscribeCB);
                  } catch (error) {
                    let err: BusinessError = error as BusinessError;
                    console.error(TAG+`订阅者a unsubscribe failed, code is ${err.code}, message is ${err.message}`);
                  }
                  try {
                    commonEventManager.unsubscribe(subscriber_b, unsubscribeCB);
                  } catch (error) {
                    let err: BusinessError = error as BusinessError;
                    console.error(TAG+`订阅者b unsubscribe failed, code is ${err.code}, message is ${err.message}`);
                  }
                  hilog.info(DOMAIN_NUMBER, TAG, 'Sub_NotificationAns_CommonEvent_Basic_0002 PASS');
                  done()
                }
              });
            } catch (error) {
              let err: BusinessError = error as BusinessError;
              console.error(TAG + `订阅者a subscribe failed, code is ${err.code}, message is ${err.message}`);
            }
          } else {
            console.error(TAG + `订阅者a createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          }
        });
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(TAG + `订阅者a createSubscriber failed, code is ${err.code}, message is ${err.message}`);
      }
      await sleep(100)
      //订阅者b,优先级为2
      let subscribeInfo_b: commonEventManager.CommonEventSubscribeInfo = {
        events: ["event11"],
        priority: 2
      };
      try {
        commonEventManager.createSubscriber(subscribeInfo_b, (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          if (!err) {
            console.info(TAG + "订阅者b createSubscriber success");
            subscriber_b = commonEventSubscriber;
            try {
              commonEventManager.subscribe(subscriber_b, (err: BusinessError, data_b: commonEventManager.CommonEventData) => {
                if (err) {
                  console.error(TAG + `订阅者b subscribe failed, code is ${err.code}, message is ${err.message}`);
                } else {
                  console.info(TAG + "订阅者b subscribe success");
                  console.info(TAG + "订阅者b Consume callback " + JSON.stringify(data_b));
                  let event_b = data_b == undefined ? 0 : data_b.event;
                  expect(event_b).assertEqual("event11")
                  // 结束订阅者对当前有序公共事件处理的回调
                  subscriber_b.finishCommonEvent((err: BusinessError)=> {
                    if (err != null) {
                      console.error(TAG +`订阅者b finishCommonEvent failed, code is ${err.code}, message is ${err.message}`);
                    } else {
                      console.info(TAG +"订阅者b finishCommonEvent success");
                    }
                  });
                }
              });
            } catch (error) {
              let err: BusinessError = error as BusinessError;
              console.error(TAG + `订阅者b subscribe failed, code is ${err.code}, message is ${err.message}`);
            }
          } else {
            console.error(TAG + `订阅者b createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          }
        });
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(TAG + `订阅者b createSubscriber failed, code is ${err.code}, message is ${err.message}`);
      }
      await sleep(100)
      //调用commonEventManager.publish接口，发布有序公共事件
      // 公共事件相关信息
      let options:commonEventManager.CommonEventPublishData = {
        code: 0,			 // 公共事件的初始代码
        data: "initial data",// 公共事件的初始数据
        isOrdered: true,		// 有序事件
      }
      // 发布公共事件
      try {
        commonEventManager.publish("event11", options, publishCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`);
      }
    })
    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Emit_0100
     * @tc.name       : 调用emitter.on接口注册eventid，取消回调的eventid没有被注册，多次调用emitter.emit接口发布事件的eventid已被注册
     * @tc.desc       : Function test
     * @tc.size       : Large-scale test
     * @tc.type       : Function test
     * @tc.level      : Level 2
     */
    it('Sub_Notification_Emitter_Publish_Emit_0100',  Level.LEVEL2, async (done: Function) => {
      // 调用持续订阅指定事件接口
      let result = 0
      emitter.on("eventId1", () => {
        console.info(TAG+'callback success'+result); //第二个参数就是订阅回调的函数，回调成功才会打印
        result += 1
        return result
      });
      //调用取消订阅事件接口
      emitter.off("eventId2");
      console.info(TAG+'emitterOff success');
      await sleep(100)
      //调用发送指定事件接口
      let eventData: emitter.EventData = {
        data: {
          "content": "c",
          "id": 1,
        }
      };
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      await sleep(100)
      console.info(TAG+'emitterEmit success');
      await sleep(1000)
      expect(result).assertEqual(5)
      done()
    })
    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Emit_0200
     * @tc.name       : 调用emitter.on注册eventid，取消回调的exentid已经被注册，多次调用emitter.emit接口发布事件的eventid已被注册
     * @tc.desc       : Function test
     * @tc.size       : Large-scale test
     * @tc.type       : Function test
     * @tc.level      : Level 3
     */
    it('Sub_Notification_Emitter_Publish_Emit_0200', Level.LEVEL3, async (done: Function) => {
      // 调用持续订阅指定事件接口
      let result = 0
      emitter.on("eventId3", () => {
        console.info(TAG+'callback success'+result); //第二个参数就是订阅回调的函数，回调成功才会打印
        result += 1
        return result
      });
      //调用取消订阅事件接口
      emitter.off("eventId3");
      console.info(TAG+'emitterOff success');
      await sleep(100)
      //调用发送指定事件接口
      let eventData: emitter.EventData = {
        data: {
          "content": "c",
          "id": 1,
        }
      };
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      await sleep(100)
      console.info(TAG+'emitterEmit success');
      await sleep(1000)
      expect(result).assertEqual(0)
      done()
    })
    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Emit_0300
     * @tc.name       : 调用emitter.once注册eventid，取消回调的eventid没有被注册，多次调用emitter.emit接口发布事件的eventid已被注册
     * @tc.desc       : Function test
     * @tc.size       : Large-scale test
     * @tc.type       : Function test
     * @tc.level      : Level 3
     */
    it('Sub_Notification_Emitter_Publish_Emit_0300', Level.LEVEL3, async (done: Function) => {
      let eventData: emitter.EventData = {
        data: {
          "content": "c",
          "id": 1,
        }
      };
      let onConsume_number = 0
      let emit_number = 0
      emitter.once("eventId5", () => {
        console.info(TAG+'once callback success'+onConsume_number);
        onConsume_number += 1
        return onConsume_number
      });
      await sleep(100)
      emitter.off("eventId6");
      console.info(TAG+'emitterOff success');
      await sleep(100)
      emitter.emit("eventId5", eventData);
      console.info(TAG+'emitterEmit success'+emit_number);
      await sleep(100) //napi异步处理局限，极限情况下会出现订阅返回2次，加等待即可
      emitter.emit("eventId5", eventData);
      console.info(TAG+'emitterEmit success');
      emitter.emit("eventId5", eventData);
      console.info(TAG+'emitterEmit success');
      emitter.emit("eventId5", eventData);
      console.info(TAG+'emitterEmit success');
      emitter.emit("eventId5", eventData);
      console.info(TAG+'emitterEmit success');
      emitter.emit("eventId5", eventData);
      console.info(TAG+'emitterEmit success');
      //调用取消订阅事件接口
      await sleep(3000)
      expect(onConsume_number).assertEqual(1)
      done()
    })
    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Emit_0400
     * @tc.name       : 调用emitter.once注册eventid，取消回调的eventid已经被注册，多次调用emitter.emit接口发布事件的eventid已被注册
     * @tc.desc       : Function test
     * @tc.size       : Large-scale test
     * @tc.type       : Function test
     * @tc.level      : Level 2
     */
    it('Sub_Notification_Emitter_Publish_Emit_0400', Level.LEVEL2, async (done: Function) => {
      let eventData: emitter.EventData = {
        data: {
          "content": "c",
          "id": 1,
        }
      };
      let onConsume_number = 0
      emitter.once("eventId7", () => {
        console.info(TAG+'once callback success'+onConsume_number);
        onConsume_number += 1
        return onConsume_number
      });
      await sleep(100)
      emitter.off("eventId7");
      console.info(TAG+'emitterOff success');
      await sleep(1000)
      emitter.emit("eventId7", eventData);
      console.info(TAG+'emitterEmit success');
      await sleep(100) //napi异步处理局限，极限情况下会出现订阅返回2次，加等待即可
      emitter.emit("eventId7", eventData);
      console.info(TAG+'emitterEmit success');
      emitter.emit("eventId7", eventData);
      console.info(TAG+'emitterEmit success');
      emitter.emit("eventId7", eventData);
      console.info(TAG+'emitterEmit success');
      emitter.emit("eventId7", eventData);
      console.info(TAG+'emitterEmit success');
      emitter.emit("eventId7", eventData);
      console.info(TAG+'emitterEmit success');
      //调用取消订阅事件接口
      await sleep(3000)
      expect(onConsume_number).assertEqual(0)
      done()
    })
    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Sendable_0001
     * @tc.name       : 调用on持续订阅事件1，调用emit多次、不同时间间隔发送指定事件1，调用off取消订阅事件1，再次调用emit发送指定事件1
     * @tc.desc       : Function test
     * @tc.size       : Medium-sized test
     * @tc.type       : Function test
     * @tc.level      : Level 2
     */
    it('Sub_Notification_Emitter_Publish_Sendable_0001',  Level.LEVEL2, async (done: Function) => {
      //调用持续订阅指定事件接口
      let result = 0

      let callback = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        console.info(TAG+'callback success111111'+result);
        result += 1
      }
      emitter.on("eventId111", callback);

      let eventData = new SelfEventData();
      emitter.emit("eventId111", eventData);
      console.info(TAG+'emitterEmit success');
      //等待5s
      await sleep(5000)
      emitter.emit("eventId111", eventData);
      console.info(TAG+'emitterEmit success 10s');
      //等待5分钟
      await sleep(5000)
      emitter.emit("eventId111", eventData);
      console.info(TAG+'emitterEmit success 10分钟');
      await sleep(3000)
      //调用取消订阅事件接口
      emitter.off("eventId111");
      console.info(TAG+'emitterOff success');
      //继续发事件
      emitter.emit("eventId111", eventData);
      console.info(TAG+'emitterEmit success 取消后');
      expect(result).assertEqual(3)
      done()
    })
    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Sendable_0002
     * @tc.name       : 调用once单次订阅事件1，调用off取消订阅事件1
     * @tc.desc       : Function test
     * @tc.size       : Medium-sized test
     * @tc.type       : Function test
     * @tc.level      : Level 2
     */
    it('Sub_Notification_Emitter_Publish_Sendable_0002', Level.LEVEL0, async (done: Function) => {
      let onConsume_number = 0
      let callback = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number += 1
      }
      emitter.once("eventId222", callback);

      //调用取消订阅事件接口
      await sleep(2000)
      emitter.off("eventId222");
      console.info(TAG+'emitterOff success');
      await sleep(100)
      expect(onConsume_number).assertEqual(0)
      done()
    })
    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Sendable_0003
     * @tc.name       : 调用once单次订阅事件1，调用emit发送指定事件1
     * @tc.desc       : Function test
     * @tc.size       : Medium-sized test
     * @tc.type       : Function test
     * @tc.level      : Level 2
     */
    it('Sub_Notification_Emitter_Publish_Sendable_0003', Level.LEVEL3, async (done: Function) => {
      let eventData = new SelfEventData();

      let onConsume_number = 0

      let callback = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number += 1
      }
      emitter.once("eventId333", callback);
      await sleep(100)
      emitter.emit("eventId333", eventData);
      console.info(TAG+'emitterEmit success');
      await sleep(1000)
      expect(onConsume_number).assertEqual(1)
      done()
    })
    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Sendable_0004
     * @tc.name       : 调用once单次订阅事件1，调用emit发送指定事件1，调用emit发送指定事件1
     * @tc.desc       : Function test
     * @tc.size       : Medium-sized test
     * @tc.type       : Function test
     * @tc.level      : Level 0
     */
    it('Sub_Notification_Emitter_Publish_Sendable_0004', Level.LEVEL0, async (done: Function) => {
      let eventData = new SelfEventData();

      let onConsume_number = 0
      let emit_number = 0

      let callback = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number += 1
      }
      emitter.once("eventId444", callback);
      await sleep(100)
      emitter.emit("eventId444", eventData);
      console.info(TAG+'emitterEmit success'+emit_number);
      await sleep(100) //napi异步处理局限，极限情况下会出现订阅返回2次，加等待即可
      emit_number += 1
      emitter.emit("eventId444", eventData);
      console.info(TAG+'emitterEmit success'+emit_number);
      await sleep(100)
      expect(onConsume_number).assertEqual(1)
      done()
    })
  })
}

function done() {
  throw new Error('Function not implemented.');
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