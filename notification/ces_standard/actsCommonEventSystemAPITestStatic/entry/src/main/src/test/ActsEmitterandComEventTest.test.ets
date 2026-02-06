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
import {BusinessError} from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import Utils from './Util.test';
import { Callback } from '@ohos.base';
let TAG: string = 'testToc';
class Sample {
  constructor() {
    this.count = 100;
  }
  printCount() {
    console.info('Print count : ' + this.count);
  }
  count: number;
}


let subscriber:commonEventManager.CommonEventSubscriber; //用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
//有序公共事件
let subscriber_a: commonEventManager.CommonEventSubscriber;
let subscriber_b: commonEventManager.CommonEventSubscriber;

export default function ActsEmitterandComEventTest() {
  const DOMAIN_NUMBER: number = 0xFF00;
  describe('actsEmitterandComEventTest', ():void => {

    /**
     * @tc.number     : Sub_NotificationAns_Emitter_Basic_Static_0001
     * @tc.name       : Sub_NotificationAns_Emitter_Basic_Static_0001
     * @tc.desc       : 事件基本功能用例
     * @tc.size       : MediumTest
     * @tc.type       : Function test
     * @tc.level      : Level 0
     */
    it('Sub_NotificationAns_Emitter_Basic_Static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let Tag :string = 'Sub_NotificationAns_Emitter_Basic_Static_0001==>'
      // 调用持续订阅指定事件接口
      let result : number = 0
      //调用发送指定事件接口
      let myDate: Record<String, Object> = {
        "id": "1",
        "content": "c"
      }
      let eventData: emitter.EventData = { data: myDate }
      let eventId01 :String = "eventId1"
      emitter.on(eventId01, ():void => {
        console.info(`${Tag} callback success`+result); //第二个参数就是订阅回调的函数，回调成功才会打印
        result += 1
      });
      await Utils.msSleep(100)

      emitter.emit("eventId1", eventData);
      await Utils.msSleep(500)
      emitter.emit("eventId1", eventData);
      await Utils.msSleep(500)
      console.info(`${Tag} emitterEmit success`);
      //调用取消订阅事件接口
      emitter.off("eventId1");
      await Utils.msSleep(2000)
      console.info(`${Tag} emitterOff success:` + result as string);
      expect(result == 2).assertTrue()
      console.info(`${Tag} PASS`);
      done()
    })

    /**
     * @tc.number     : Sub_NotificationAns_Emitter_Basic_Static_0002
     * @tc.name       : Sub_NotificationAns_Emitter_Basic_Static_0002
     * @tc.desc       : 事件基本功能用例
     * @tc.size       : Medium-sized test
     * @tc.type       : Function test
     * @tc.level      : Level 0
     */
    it('Sub_NotificationAns_Emitter_Basic_Static_0002',  TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let Tag :string = 'Sub_NotificationAns_Emitter_Basic_Static_0002==>'

      let myDate: Record<String, Object> = {
        "id": "1",
        "content": "c"
      }
      let eventData: emitter.EventData = { data: myDate }
      let onConsume_number : number = 0
      let emit_number : number = 0

      emitter.once("eventId2", () :void=> {
        console.info(Tag+'once callback success'+onConsume_number);
        onConsume_number += 1
        // return onConsume_number
      });
      await Utils.msSleep(100)
      emitter.emit("eventId2", eventData);
      console.info(Tag+'emitterEmit success'+emit_number);
      await Utils.msSleep(100) //napi异步处理局限，极限情况下会出现订阅返回2次，加等待即可
      emit_number += 1
      emitter.emit("eventId2", eventData);
      console.info(Tag+'emitterEmit success'+emit_number);
      //调用取消订阅事件接口
      await Utils.msSleep(2000)
      emitter.off("eventId2");
      console.info(Tag+'emitterOff success');
      await Utils.msSleep(100)
      expect(onConsume_number).assertEqual(1)
      console.info('Sub_NotificationAns_Emitter_Basic_Static_0002 PASS');
      done()
    })

    /**
     * @tc.number     : Sub_NotificationAns_CommonEvent_Basic_Static_0001
     * @tc.name       : Sub_NotificationAns_CommonEvent_Basic_Static_0001
     * @tc.desc       : 公共事件基础用例验证
     * @tc.size       : Medium-sized test
     * @tc.type       : Function test
     * @tc.level      : Level 0
     */
    it('Sub_NotificationAns_CommonEvent_Basic_Static_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_NotificationAns_CommonEvent_Basic_Static_0001==>'
        let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
          events: ["event"]
        };
        //调用commonEventManager.subscribe接口，以回调形式订阅公共事件
        //创建订阅者
        try {
          commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber: commonEventManager.CommonEventSubscriber|undefined) => {
            if (!err) {
              console.info(Tag + " createSubscriber success");
              if(commonEventSubscriber !== undefined){
                subscriber = commonEventSubscriber
              }else{
                expect(false).assertTrue()
                done()
              }
              //订阅公共事件
              try {
                commonEventManager.subscribe(subscriber, (err: BusinessError|null, data: commonEventManager.CommonEventData|undefined) => {
                  if (err) {
                    console.error(Tag + ` subscribe failed, err is ${JSON.stringify(err)}`);
                    expect(false).assertTrue()
                    done()
                  } else {
                    console.info(Tag + " subscribe success");
                    let event = data == undefined ? 0 : data.event;
                    console.error(Tag + `Consume callback , event is ${JSON.stringify(event)}`);
                    expect(event).assertEqual("event")
                  }
                });
              } catch (error) {
                let err: BusinessError = error as BusinessError;
                console.error(Tag + ` subscribe failed, code is err.code,messageis{err.code}, message is {err.message}`);
                expect(false).assertTrue()
                done()
              }
            } else {
              console.error(Tag + ` createSubscriber failed, code is err.code,messageis{err.code}, message is {err.message}`);
              expect(false).assertTrue()
              done()
            }
          });
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error(Tag + ` createSubscriber failed, code is err.code,messageis{err.code}, message is {err.message}`);
          expect(false).assertTrue()
          done()
        }
        await Utils.msSleep(100)
        //调用commonEventManager.publish接口，发布公共事件
        try {
          commonEventManager.publish("event", (err: BusinessError | null) =>{
            if (err) {
              console.error(Tag+` publish failed, code is ${err.code}, message is ${err.message}`);
              expect(err?.code).assertEqual(0)
              done()
            } else {
              console.info(Tag+" publish Success");
            }
          });
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error(Tag+` publish failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        }
        await Utils.msSleep(1000)
        //调用commonEventManager.unsubscribe接口，回调形式取消订阅公共事件
        try {
          commonEventManager.unsubscribe(subscriber, (err: BusinessError | null) =>{
            if (err) {
              console.error(Tag+`unsubscribe failed, code is ${err.code}, message is ${err.message}`);
              expect(err?.code).assertEqual(0)
              done()
            } else {
              console.info(Tag+" unsubscribe Success");
            }
          });
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error(Tag+` unsubscribe failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        }
        console.info(Tag+' Sub_NotificationAns_CommonEvent_Basic_Static_0001 PASS');
        done()
      })

    //问题单号:DTS2025061412066
    /**
     * @tc.number     : Sub_NotificationAns_CommonEvent_Basic_Static_0002
     * @tc.name       : Sub_NotificationAns_CommonEvent_Basic_Static_0002
     * @tc.desc       : 公共事件基础用例验证
     * @tc.size       : Medium-sized test
     * @tc.type       : Function test
     * @tc.level      : Level 0
     */
    it('Sub_NotificationAns_CommonEvent_Basic_Static_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_NotificationAns_CommonEvent_Basic_Static_0002==>'
        //订阅者a，优先级为1
        let subscribeInfo_a: commonEventManager.CommonEventSubscribeInfo = {
          events: ["event11"],
          priority: 1
        };
        try {
          commonEventManager.createSubscriber(subscribeInfo_a, (err: BusinessError | null, commonEventSubscriber: commonEventManager.CommonEventSubscriber|undefined) => {
            if (!err) {
              console.info(Tag + "订阅者a createSubscriber success");
              if(commonEventSubscriber !== undefined){
                subscriber_a = commonEventSubscriber
              }else{
                expect(false).assertTrue()
                done()
              }
              try {
                commonEventManager.subscribe(subscriber_a, (err: BusinessError|null, data_a: commonEventManager.CommonEventData|undefined) => {
                  if (err) {
                    console.error(Tag + `订阅者a subscribe failed, code is , message is ${err}`);
                  } else {
                    console.info(Tag + "订阅者a subscribe success");
                    let event_a = data_a == undefined ? 0 : data_a.event;
                    console.error(Tag + `Consume callback , event is ${JSON.stringify(event_a)}`);
                    expect(event_a).assertEqual("event11")
                    // 结束订阅者对当前有序公共事件处理的回调
                    subscriber_a.finishCommonEvent((err: BusinessError | null)=> {
                      if (err !==null) {
                        console.error(Tag +`订阅者a finishCommonEvent failed, code is ${err.code}, message is ${err.message}`);
                      } else {
                        console.info(Tag +"订阅者a finishCommonEvent success");
                      }
                    });
                    //取消订阅
                    //取消订阅a
                    try {
                      commonEventManager.unsubscribe(subscriber_a, (err: BusinessError | null) =>{
                        if (err) {
                          console.error(Tag+`unsubscribe failed, code is ${err.code}, message is ${err.message}`);
                          expect(err?.code).assertEqual(0)
                          done()
                        } else {
                          console.info(Tag+" unsubscribe Success");
                        }
                      });
                    } catch (error) {
                      let err: BusinessError = error as BusinessError;
                      console.error(Tag +`订阅者a unsubscribe failed, code is ${err.code}, message is ${err.message}`);
                      expect(false).assertTrue()
                      done()
                    }
                    try {
                      commonEventManager.unsubscribe(subscriber_b, (err: BusinessError | null) =>{
                        if (err) {
                          console.error(Tag+`unsubscribe failed, code is ${err.code}, message is ${err.message}`);
                          expect(err?.code).assertEqual(0)
                          done()
                        } else {
                          console.info(Tag+" unsubscribe Success");
                        }
                      });
                    } catch (error) {
                      let err: BusinessError = error as BusinessError;
                      console.error(Tag +`订阅者b unsubscribe failed, code is ${err.code}, message is ${err.message}`);
                      expect(false).assertTrue()
                      done()
                    }
                    console.info(Tag +'Sub_NotificationAns_CommonEvent_Basic_0002 PASS');
                    done()
                  }
                });
              } catch (error) {
                let err: BusinessError = error as BusinessError;
                console.error(Tag + `订阅者a subscribe failed, code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue()
                done()
              }
            } else {
              console.error(Tag + `订阅者a createSubscriber failed, code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue()
              done()
            }
          });
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error(Tag + `订阅者a createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        }
        await Utils.msSleep(100)
        //订阅者b,优先级为2
        let subscribeInfo_b: commonEventManager.CommonEventSubscribeInfo = {
          events: ["event11"],
          priority: 2
        };
        try {
          commonEventManager.createSubscriber(subscribeInfo_b, (err: BusinessError | null, commonEventSubscriber: commonEventManager.CommonEventSubscriber|undefined) => {
            if (!err) {
              console.info(Tag + "订阅者b createSubscriber success");
              if(commonEventSubscriber !== undefined){
                subscriber_b = commonEventSubscriber
              }else{
                expect(false).assertTrue()
                done()
              }
              try {
                commonEventManager.subscribe(subscriber_b, (err: BusinessError|null, data_b: commonEventManager.CommonEventData|undefined) => {
                  if (err) {
                    console.error(Tag + `订阅者b subscribe failed, code is , message is ${err}`);
                  } else {
                    console.info(Tag + "订阅者b subscribe success");
                    let event_b = data_b == undefined ? 0 : data_b.event;
                    console.error(Tag + `Consume callback , event is ${JSON.stringify(event_b)}`);
                    expect(event_b).assertEqual("event11")
                    // 结束订阅者对当前有序公共事件处理的回调
                    subscriber_b.finishCommonEvent((err: BusinessError | null)=> {
                      if (err != null) {
                        console.error(Tag +`订阅者b finishCommonEvent failed, code is ${err.code}, message is ${err.message}`);
                      } else {
                        console.info(Tag +"订阅者b finishCommonEvent success");
                      }
                    });
                  }
                });
              } catch (error) {
                let err: BusinessError = error as BusinessError;
                console.error(Tag + `订阅者b subscribe failed, code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue()
                done()
              }
            } else {
              console.error(Tag + `订阅者b createSubscriber failed, code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue()
              done()
            }
          });
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error(Tag + `订阅者b createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        }
        await Utils.msSleep(100)
        //调用commonEventManager.publish接口，发布有序公共事件
        // 公共事件相关信息
        let options:commonEventManager.CommonEventPublishData = {
          code: 0,			 // 公共事件的初始代码
          data: "initial data",// 公共事件的初始数据
          isOrdered: true,		// 有序事件
        }
        // 发布公共事件
        try {
          commonEventManager.publish("event11", options, (err: BusinessError | null) =>{
            if (err) {
              console.error(Tag+` publish failed, code is ${err.code}, message is ${err.message}`);
              expect(err?.code).assertEqual(0)
              done()
            } else {
              console.info(Tag+" publish Success");
            }
          });
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error(Tag+`publish failed, code is ${err.code}, message is ${err.message}`);
          done()
        }
      })


    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Emit_Static_0100
     * @tc.name       : Sub_Notification_Emitter_Publish_Emit_Static_0100
     * @tc.desc       : Function test
     * @tc.size       : Large-scale test
     * @tc.type       : Function test
     * @tc.level      : Level 2
     */
    it('Sub_Notification_Emitter_Publish_Emit_Static_0100',  TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let Tag :string = 'Sub_Notification_Emitter_Publish_Emit_Static_0100==>'
      // 调用持续订阅指定事件接口
      let result = 0
      emitter.on("eventId1", () :void => {
        console.info(`${Tag}  callback success`+result); //第二个参数就是订阅回调的函数，回调成功才会打印
        result += 1
      });
      //调用取消订阅事件接口
      emitter.off("eventId2");
      console.info(`${Tag}  emitterOff success`);
      await Utils.msSleep(100)
      let myDate: Record<String, Object> = {
        "id": "1",
        "content": "c"
      }
      let eventData: emitter.EventData = { data: myDate }
      await Utils.msSleep(100)
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      await Utils.msSleep(100)
      console.info(`${Tag} emitterEmit success`);
      await Utils.msSleep(2000)
      expect(result).assertEqual(5)
      console.info(`${Tag} Sub_Notification_Emitter_Publish_Emit_0100 END`);
      done()
    })
    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Emit_Static_0200
     * @tc.name       : Sub_Notification_Emitter_Publish_Emit_Static_0200
     * @tc.desc       : Function test
     * @tc.size       : Large-scale test
     * @tc.type       : Function test
     * @tc.level      : Level 3
     */
    it('Sub_Notification_Emitter_Publish_Emit_Static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let Tag :string = 'Sub_Notification_Emitter_Publish_Emit_Static_0200==>'
      // 调用持续订阅指定事件接口
      let result = 0
      emitter.on("eventId3", ():void => {
        console.info(`${Tag} callback success`+result); //第二个参数就是订阅回调的函数，回调成功才会打印
        result += 1
      });
      //调用取消订阅事件接口
      emitter.off("eventId3");
      console.info(`${Tag} emitterOff success`);
      await Utils.msSleep(100)
      let myDate: Record<String, Object> = {
        "id": "1",
        "content": "c"
      }
      let eventData: emitter.EventData = { data: myDate }
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      emitter.emit("eventId1", eventData);
      await Utils.msSleep(100)
      console.info(`${Tag} emitterEmit success`);
      await Utils.msSleep(2000)
      expect(result).assertEqual(0)
      done()
    })

    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Emit_Static_0300
     * @tc.name       : Sub_Notification_Emitter_Publish_Emit_Static_0300
     * @tc.desc       : Function test
     * @tc.size       : Large-scale test
     * @tc.type       : Function test
     * @tc.level      : Level 3
     */
    it('Sub_Notification_Emitter_Publish_Emit_Static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let Tag :string = 'Sub_Notification_Emitter_Publish_Emit_Static_0300==>'
      let myDate: Record<String, Object> = {
        "id": 1,
        "content": "c"
      }
      let eventData: emitter.EventData = { data: myDate }
      let onConsume_number : number = 0
      let emit_number : number = 0
      emitter.once("eventId5", ():void => {
        console.info(Tag +'once callback success'+onConsume_number);
        onConsume_number += 1
        // return onConsume_number
      });
      await Utils.msSleep(100)
      emitter.off("eventId6");
      console.info(Tag +'emitterOff success');
      await Utils.msSleep(100)
      emitter.emit("eventId5", eventData);
      console.info(Tag +'emitterEmit success'+emit_number);
      await Utils.msSleep(100) //napi异步处理局限，极限情况下会出现订阅返回2次，加等待即可
      emitter.emit("eventId5", eventData);
      console.info(Tag +'emitterEmit success');
      emitter.emit("eventId5", eventData);
      console.info(Tag +'emitterEmit success');
      emitter.emit("eventId5", eventData);
      console.info(Tag +'emitterEmit success');
      emitter.emit("eventId5", eventData);
      console.info(Tag +'emitterEmit success');
      emitter.emit("eventId5", eventData);
      console.info(Tag +'emitterEmit success');
      //调用取消订阅事件接口
      await Utils.msSleep(3000)
      expect(onConsume_number).assertEqual(1)
      done()
    })
    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Emit_Static_0400
     * @tc.name       : Sub_Notification_Emitter_Publish_Emit_Static_0400
     * @tc.desc       : Function test
     * @tc.size       : Large-scale test
     * @tc.type       : Function test
     * @tc.level      : Level 2
     */
    it('Sub_Notification_Emitter_Publish_Emit_Static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let Tag :string = 'Sub_Notification_Emitter_Publish_Emit_Static_0400==>'
      let myDate: Record<String, Object> = {
        "id": 1,
        "content": "c"
      }
      let eventData: emitter.EventData = { data: myDate }
      let onConsume_number : number = 0
      emitter.once("eventId7", ():void => {
        console.info(Tag +'once callback success'+onConsume_number);
        onConsume_number += 1
        // return onConsume_number
      });
      await Utils.msSleep(100)
      emitter.off("eventId7");
      console.info(Tag +'emitterOff success');
      await Utils.msSleep(1000)
      emitter.emit("eventId7", eventData);
      console.info(Tag +'emitterEmit success');
      await Utils.msSleep(100) //napi异步处理局限，极限情况下会出现订阅返回2次，加等待即可
      emitter.emit("eventId7", eventData);
      console.info(Tag +'emitterEmit success');
      emitter.emit("eventId7", eventData);
      console.info(Tag +'emitterEmit success');
      emitter.emit("eventId7", eventData);
      console.info(Tag +'emitterEmit success');
      emitter.emit("eventId7", eventData);
      console.info(Tag +'emitterEmit success');
      emitter.emit("eventId7", eventData);
      console.info(Tag +'emitterEmit success');
      //调用取消订阅事件接口
      await Utils.msSleep(3000)
      expect(onConsume_number).assertEqual(0)
      done()
    })

    //问题单号：DTS2025051640226
    /**
     * @tc.number     : Sub_Notification_Emitter_Publish_Sendable_Static_0001
     * @tc.name       : Sub_Notification_Emitter_Publish_Sendable_Static_0001
     * @tc.desc       : Function test
     * @tc.size       : Medium-sized test
     * @tc.type       : Function test
     * @tc.level      : Level 2
     */
    it('Sub_Notification_Emitter_Publish_Sendable_Static_0001',  TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let Tag :string = 'Sub_Notification_Emitter_Publish_Sendable_Static_0001==>'
      //调用持续订阅指定事件接口
      let result = 0

      let callback1 = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        console.info(Tag +' on GenericEventData');
      }
      emitter.on<Sample>("eventId", callback1);
      let a = new Sample();
      let eventData: emitter.GenericEventData<Sample> = {data:a};
      emitter.emit<Sample>("eventId", eventData);
      emitter.emit<Sample>("eventId111", eventData);
      console.info(Tag +' emitterEmit success');
      //等待5s
      await Utils.msSleep(5000)
      emitter.emit<Sample>("eventId111", eventData);
      console.info(Tag+ ' emitterEmit success 10s');
      //等待5分钟
      await Utils.msSleep(5000)
      emitter.emit<Sample>("eventId111", eventData);
      console.info(Tag+ ' emitterEmit success 10分钟');
      await Utils.msSleep(3000)
      //调用取消订阅事件接口
      emitter.off("eventId111");
      console.info(Tag+ ' emitterOff success');
      //继续发事件
      emitter.emit<Sample>("eventId111", eventData);
      await Utils.msSleep(2000)
      console.info(Tag+ ' emitterEmit success 取消后');
      expect(result).assertEqual(3)
      done()
    })

    //
    // //问题单号：DTS2025051640226
    // /**
    //  * @tc.number     : Sub_Notification_Emitter_Publish_Sendable_Static_0002
    //  * @tc.name       : Sub_Notification_Emitter_Publish_Sendable_Static_0002
    //  * @tc.desc       : Function test
    //  * @tc.size       : Medium-sized test
    //  * @tc.type       : Function test
    //  * @tc.level      : Level 2
    //  */
    // it('Sub_Notification_Emitter_Publish_Sendable_Static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   let Tag :string = 'Sub_Notification_Emitter_Publish_Sendable_Static_0002==>'
    //   let onConsume_number : number = 0
    //   let callback = (eventData: emitter.GenericEventData<Sample>): void => {
    //     console.info(Tag +' on GenericEventData');
    //     let storage: Sample = eventData.data! as Sample;
    //     storage.printCount();
    //     onConsume_number += 1
    //   }
    //   emitter.once<Sample>("eventId222", callback);
    //
    //   //调用取消订阅事件接口
    //   await Utils.msSleep(2000)
    //   emitter.off("eventId222");
    //   console.info(Tag +'emitterOff success');
    //   await Utils.msSleep(100)
    //   expect(onConsume_number).assertEqual(0)
    //   done()
    // })
    //
    // //问题单号：DTS2025051640226
    // /**
    //  * @tc.number     : Sub_Notification_Emitter_Publish_Sendable_Static_0003
    //  * @tc.name       : Sub_Notification_Emitter_Publish_Sendable_Static_0003
    //  * @tc.desc       : Function test
    //  * @tc.size       : Medium-sized test
    //  * @tc.type       : Function test
    //  * @tc.level      : Level 2
    //  */
    // it('Sub_Notification_Emitter_Publish_Sendable_Static_0003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
    //   let Tag :string = 'Sub_Notification_Emitter_Publish_Sendable_Static_0003==>'
    //
    //   let onConsume_number : number= 0
    //
    //   let callback = (eventData: emitter.GenericEventData<Sample>): void => {
    //     console.info(Tag +' on GenericEventData');
    //     let storage: Sample = eventData.data! as Sample;
    //     storage.printCount();
    //     onConsume_number += 1
    //   }
    //   emitter.once<Sample>("eventId333", callback);
    //   await Utils.msSleep(100)
    //   emitter.emit<Sample>("eventId333", eventData);
    //   console.info(Tag+ 'emitterEmit success');
    //   await Utils.msSleep(1000)
    //   expect(onConsume_number).assertEqual(1)
    //   done()
    // })
    //
    // //问题单号：DTS2025051640226
    // /**
    //  * @tc.number     : Sub_Notification_Emitter_Publish_Sendable_Static_0004
    //  * @tc.name       : Sub_Notification_Emitter_Publish_Sendable_Static_0004
    //  * @tc.desc       : Function test
    //  * @tc.size       : Medium-sized test
    //  * @tc.type       : Function test
    //  * @tc.level      : Level 0
    //  */
    // it('Sub_Notification_Emitter_Publish_Sendable_Static_0004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   let Tag :string = 'Sub_Notification_Emitter_Publish_Sendable_Static_0004==>'
    //
    //   let onConsume_number : number = 0
    //   let emit_number : number = 0
    //
    //   let callback = (eventData: emitter.GenericEventData<Sample>): void => {
    //     console.info(Tag +' on GenericEventData');
    //     let storage: Sample = eventData.data! as Sample;
    //     storage.printCount();
    //     onConsume_number += 1
    //   }
    //   emitter.once<Sample>("eventId444", callback);
    //   await Utils.msSleep(100)
    //   emitter.emit<Sample>("eventId444", eventData);
    //   console.info(Tag+'emitterEmit success'+emit_number);
    //   await Utils.msSleep(1000) //napi异步处理局限，极限情况下会出现订阅返回2次，加等待即可
    //   emit_number += 1
    //   emitter.emit<Sample>("eventId444", eventData);
    //   console.info(Tag+'emitterEmit success'+emit_number);
    //   await Utils.msSleep(100)
    //   expect(onConsume_number).assertEqual(1)
    //   done()
    // })

  })
}