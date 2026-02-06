/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commonEventManager from '@ohos.commonEventManager'
import { notificationManager } from '@kit.NotificationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common, wantAgent } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import { CustomGlobal } from '../testability/CustomGlobal';
import notification from '@ohos.notification';
import { image } from '@kit.ImageKit';


export async function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
};

export default function ActsCommonEventSystemAPITest() {
describe('SUB_NOTIFICATION_CES_SYSTEM_API_TEST', () => {
    let TAG = 'SUB_NOTIFICATION_CES_SYSTEM_API_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_CES_SYSTEM_API_TEST START')

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_5000
     * @tc.name: publishAsUser 
     * @tc.desc: test function publishAsBundle
     */
    it('Sub_Notification_Ans_Publish_Publish_5000', Level.LEVEL3, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_5000 START`);

        commonEventManager.publishAsUser("event.test", 0, (err) => {
            if (err) {
                console.info(`${TAG} publishAsUser AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} publishAsUser AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_5000 END`);
    });

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_5100
     * @tc.name: publishAsUser
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ans_Publish_Publish_5100', Level.LEVEL3, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_5100 START`);

        let publishData: commonEventManager.CommonEventPublishData = {
            bundleName: "example.bundleName",
            code: 1
        }

        commonEventManager.publishAsUser("event.test", 0, publishData, (err) => {
            if (err) {
                console.info(`${TAG} publishAsUser AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} publishAsUser AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_5100 END`);
    });

    /*
     * @tc.number: Sub_Notification_Ces_StaticEvent_Config_1200
     * @tc.name: removeStickyCommonEvent
     * @tc.desc: test function removeStickyCommonEvent
     */
    it('Sub_Notification_Ces_StaticEvent_Config_1200', Level.LEVEL3, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ces_StaticEvent_Config_1200 START`);

        commonEventManager.removeStickyCommonEvent("sticky_event", (err) => {
            if (err) {
                console.info(`${TAG} remove sticky event AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info("${TAG} remove sticky event AsyncCallback success");
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} Sub_Notification_Ces_StaticEvent_Config_1200 END`);
    });

    /*
     * @tc.number: Sub_Notification_Ces_StaticEvent_Config_1300
     * @tc.name: removeStickyCommonEvent
     * @tc.desc: test function removeStickyCommonEvent
     */
    it('Sub_Notification_Ces_StaticEvent_Config_1300', Level.LEVEL3, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ces_StaticEvent_Config_1300 START`);

        commonEventManager.removeStickyCommonEvent("sticky_event").then(() => {
            console.info("${TAG} remove sticky event AsyncCallback success");
            expect(false).assertTrue()
            done()
        }).catch ((err: BusinessError) => {
            console.info(`${TAG} remove sticky event AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(202);
            done()
        });

        console.info(`${TAG} Sub_Notification_Ces_StaticEvent_Config_1300 END`);
    });

    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_7900_278
     * @tc.name: commonEventManager.publish
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_7900_278', Level.LEVEL2, (done: Function) => {
      //构造commonEventManager.publish401错误码
      try {
        commonEventManager.publish("EVENT01", null);
        expect(false).assertTrue()
        done()
      } catch (err) {
        hilog.info(0x0000, 'testTag', `publish1 err: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401)
        done()
      }

      let options: commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial data",
        isOrdered: true
      }
      try {
        commonEventManager.publish("EVENT01", options, null);
        expect(false).assertTrue()
        done()
      } catch (err) {
        hilog.info(0x0000, 'testTag', `publish2 err: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401)
        done()
      }
      ;

      //构造commonEventManager.createSubscriberSync401错误码
      try {
        commonEventManager.createSubscriberSync(null);
        expect(false).assertTrue()
        done()
      } catch (err) {
        hilog.info(0x0000, 'testTag', `createSubscriberSync err: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401)
        done()
      }

      //构造commonEventManager.subscribe 401错误码
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["event05"]
      }
      let subscriber = commonEventManager.createSubscriberSync(subscribeInfo)
      try {
        commonEventManager.subscribe(subscriber, null);
        expect(false).assertTrue()
        done()
      } catch (err) {
        hilog.info(0x0000, 'testTag', `createSubscriberSync err: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401)
        done()
      }

      //构造commonEventManager.subscribe 401错误码
      try {
        commonEventManager.unsubscribe(null, null);
        expect(false).assertTrue()
        done()
      } catch (err) {
        hilog.info(0x0000, 'testTag', `createSubscriberSync err: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_7900_279
     * @tc.name: commonEventManager.publish
     * @tc.desc: test function publishAsUser
     */
     it('Sub_Notification_Ces_Publish_CommonEvent_7900_279', Level.LEVEL2, async (done: Function) => {
      //构造notificationManager.publish 1600004错误码
      let basicContent: notificationManager.NotificationBasicContent = {
        title: "test_title",
        text: "test_text",
        additionalText: "test_Publish"
      }

      let notifyContent: notificationManager.NotificationContent = {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: basicContent
      }

      let notificationRequest: notificationManager.NotificationRequest = {
        content: notifyContent,
        id: 1,
      }

      notificationManager.publish(notificationRequest, (err) => {
        console.info('publish1 fail,result is :', JSON.stringify(err));
        expect(err.code).assertEqual(1600004);
      })

      await notificationManager.publish(notificationRequest).then(() => {
        console.info(TAG + "publish update success");
        expect(false).assertTrue()
        done();
      }).catch((err: BusinessError) => {
        console.info('publish2 fail,result is :', JSON.stringify(err));
        expect(err.code).assertEqual(1600004);
      });


      // 构造notificationManager.publish 1600007错误码
      let notificationRequest1600007: notificationManager.NotificationRequest = {
        id: 5,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
          liveView: {
            title: "wh",
            text: "content",
            status: 1,
            version: 2,
            extraInfo: {
              "event": "TAXI",
              "isMute": false,
              "PrimaryData.title": "title更新",
              "PrimaryData.content": '[{"text":"您的滴滴快车还有2分钟到达","textColor":"#FFFF0000"}]',
              "PrimaryData.keepTime": 60,
              "PrimaryData.extend.text": "extendData text",
              "PrimaryData.extend.type": 1,
              "LayoutData.layoutType": 4,
              "PickupLayout.title": "layout title更新",
              "PickupLayout.content": "layout content更新后",
              "PickupLayout.underlineColor": "#FFFFFFFF",
              "CapsuleData.status": 1,
              "CapsuleData.type": 1,
              "CapsuleData.backgroundColor": "#FFFFFFFF",
              "CapsuleData.title": "capsule title",
              "CapsuleData.content": "capsule content",
              "TimerCapsule.content": "capsule title",
              "TimerCapsule.initialtime": 7349485944,
              "TimerCapsule.isCountdown": false,
              "TimerCapsule.isPause": true
            },
          },
        },
        notificationSlotType: notificationManager.SlotType.LIVE_VIEW,
        isOngoing: true,
        isUnremovable: false,
        extraInfo: {
          'testKey': 'testValue'
        },
      }
      notificationManager.publish(notificationRequest1600007, (err: BusinessError) => {
        console.info('publish3 fail,result is :', JSON.stringify(err));
        expect(err.code).assertEqual(1600007);
        console.info(' Succeeded in publishing notification.');
      });

      await notificationManager.publish(notificationRequest1600007).then(() => {
        console.info(TAG + "publish update success");
        expect(false).assertTrue()
        done();
      }).catch((err: BusinessError) => {
        console.info('publish4 fail,result is :', JSON.stringify(err));
        expect(err.code).assertEqual(1600007);
      });

      let notificationRequest1600014: notificationManager.NotificationRequest = {
        id: 1600014,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
          liveView: {
            title: "wh",
            text: "content",
            status: 0,
            version: 2,
            extraInfo: {
              "event": "TAXI",
              "isMute": false,
              "PrimaryData.title": "title更新",
              "PrimaryData.content": '[{"text":"您的滴滴快车还有2分钟到达","textColor":"#FFFF0000"}]',
              "PrimaryData.keepTime": 60,
              "PrimaryData.extend.text": "extendData text",
              "PrimaryData.extend.type": 1,
              "LayoutData.layoutType": 4,
              "PickupLayout.title": "layout title更新",
              "PickupLayout.content": "layout content更新后",
              "PickupLayout.underlineColor": "#FFFFFFFF",
              "CapsuleData.status": 1,
              "CapsuleData.type": 1,
              "CapsuleData.backgroundColor": "#FFFFFFFF",
              "CapsuleData.title": "capsule title",
              "CapsuleData.content": "capsule content",
              "TimerCapsule.content": "capsule title",
              "TimerCapsule.initialtime": 7349485944,
              "TimerCapsule.isCountdown": false,
              "TimerCapsule.isPause": true
            },
          },
        },
        notificationSlotType: notificationManager.SlotType.LIVE_VIEW,
        isOngoing: true,
        isUnremovable: false,
        extraInfo: {
          'testKey': 'testValue'
        }
      }
      await sleep(500);
      notificationManager.publish(notificationRequest1600014, (err: BusinessError) => {
        console.info('notificationRequest1600014 callback fail,result is :', JSON.stringify(err));
        expect(err.code).assertEqual(1600014);
      });

      await notificationManager.publish(notificationRequest1600014).then(() => {
        console.info(TAG + "publish update success");
        expect(false).assertTrue()
        done();
      }).catch((err: BusinessError) => {
        console.info('notificationRequest1600014 promiss fail,result is :', JSON.stringify(err));
        expect(err.code).assertEqual(1600014);
        done()
      });

    })

    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_7900_280
     * @tc.name: commonEventManager.publish
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_7900_280', Level.LEVEL2, async (done: Function) => {
      let id = 1
      let label = "label"
      try {
        notificationManager.cancel(null, (err) => {
          if (err) {
            console.info(`${TAG} cancel id err: ${err.code}, errMes: ${err.message}`)
            expect(true).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancel id success`)
            expect(false).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} cancel1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(401)
      }

      notificationManager.cancel(id, (err) => {
        console.info(`${TAG} cancel2 AsyncCallback err: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(1600007)
      })

      try {
        notificationManager.cancel(null, label, (err) => {
          console.info(`${TAG} cancel id success`)
          expect(false).assertTrue()
          done()
        })
      } catch (err) {
        console.info(`${TAG} cancel3 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(401)
      }

      notificationManager.cancel(id, label, (err) => {
        console.info(`${TAG} cancel4 AsyncCallback err: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(1600007)
      })

      await notificationManager.cancel(id, label).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err: BusinessError) => {
        console.info(`${TAG} cancel5 Promise err: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(1600007)
        done()
      })

    })

    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_7900_281
     * @tc.name: commonEventManager.publish
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_7900_281', Level.LEVEL2, async (done: Function) => {

      try {
        notificationManager.addSlot(null, (err) => {
          console.info(`addSlot SOCIAL_COMMUNICATION success`);
          expect(false).assertTrue();
          done();
        })
      } catch (err) {
        console.info(`${TAG} addSlot1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(401)
      }

      try {
        await notificationManager.addSlot(15).then(() => {
          console.info(`${TAG} addSlot Promise success`)
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError) => {
          console.info(`${TAG} addSlot Promise errCode: ${err.code}, errMes: ${err.message}`)
          expect(err.code).assertEqual(401)
          done()
        })
      } catch (err) {
        console.info(`${TAG} addSlot2 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(401)
      }

      try {
        notificationManager.getSlot(null, (err, NotificationSlot) => {
          console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
          expect(false).assertTrue();
          done();
        })
      }catch (err) {
        console.info(`${TAG} getSlot1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(401)
      }

      try {
        notificationManager.removeSlot(null, (err) => {
          console.info(`${TAG} removeSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      } catch (err) {
        console.info(`${TAG} removeSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(401)
      }

      try {
        notificationManager.cancelGroup(null, (err) => {
          console.info(`${TAG} cancelGroup AsyncCallback err: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      } catch (err) {
        console.info(`${TAG} cancelGroup AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(401)

      }

      try {
        notificationManager.isSupportTemplate(null, (err) => {
          console.info(`${TAG} isSupportTemplate AsyncCallback err: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      } catch (err) {
        console.info(`${TAG} isSupportTemplate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(401)
        done()
      }

    })

    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_7900_284
     * @tc.name: commonEventManager.publish
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_7900_284', Level.LEVEL2, async (done: () => void) => {
      try {
        notificationManager.setBadgeNumber(null, (err) => {
          console.log(`setBadgeNumber failed, error code: ${err.code}, message: ${err.message}`)
          if (err.code == 801) {
            expect(true).assertTrue()
            done()
          } else {
            expect(false).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.log(`setBadgeNumber failed, catch error code: ${err.code}, message: ${err.message}`)
        if (err.code == 801) {
          expect(true).assertTrue()
          done()
        } else {
          expect(err.code).assertEqual(401)
          done()
        }
      }


      // 定义订阅者，用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["event284"],
        publisherBundleName: 'com.example.myapplication'
      };

      commonEventManager.createSubscriber(subscribeInfo, async (err, commonEventSubscriber) => {
        if (err) {
          console.info(`Sub_Notification_Ces_Publish_CommonEvent_7900_284 err, error code: ${err.code}, message: ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`Sub_Notification_Ces_Publish_CommonEvent_7900_284 success ${commonEventSubscriber}`)
          subscriber = commonEventSubscriber

          try {
            subscriber.getCode(null)
          }catch (err) {
            console.info(`${TAG} getCode err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.setCode(null, (err) => {
              console.info(`${TAG} setCode id success`)
              expect(false).assertTrue()
              done()
            })
          } catch (err) {
            console.info(`${TAG} setCode err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.getData(null)
          }catch (err) {
            console.info(`${TAG} getData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.setData(null, (err) => {
              console.info(`setData_1 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })
          } catch (err) {
            console.info(`${TAG} setData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.clearAbortCommonEvent(null)
          }catch (err) {
            console.info(`${TAG} clearAbortCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }


          try {
            subscriber.setCodeAndData(null, 'data02', (err) => {
              console.info(`${TAG} setCodeAndData id success`)
              expect(false).assertTrue()
              done()
            })
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.isOrderedCommonEvent(null)
          }catch (err) {
            console.info(`${TAG} isOrderedCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.isStickyCommonEvent(null)
          }catch (err) {
            console.info(`${TAG} isStickyCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.abortCommonEvent(null)
          }catch (err) {
            console.info(`${TAG} abortCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.clearAbortCommonEvent(null)
          }catch (err) {
            console.info(`${TAG} clearAbortCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.getAbortCommonEvent(null)
          }catch (err) {
            console.info(`${TAG} getAbortCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.getSubscribeInfo(null)
          }catch (err) {
            console.info(`${TAG} getSubscribeInfo err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.finishCommonEvent(null)
          }catch (err) {
            console.info(`${TAG} finishCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

        }
      })
    })

    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_7900_282
     * @tc.name: commonEventManager.publish
     * @tc.desc: test function publishAsUser
     */
it('Sub_Notification_Ces_Publish_CommonEvent_7900_282', Level.LEVEL2, async (done: Function) => {
  notificationManager.requestEnableNotification(CustomGlobal.context)

  await sleep(1000)
  notificationManager.requestEnableNotification((err) => {
    console.error(`requestEnableNotification1 failed, code is ${err.code}, message is ${err.message}`);
    expect(err.code).assertEqual(1600013)
  });

  await notificationManager.requestEnableNotification().then(() => {
    console.info(`${TAG} requestEnableNotification Promise success`)
    expect(false).assertTrue()
    done()
  }).catch((err: BusinessError) => {
    console.info(`${TAG} requestEnableNotification Promise err: ${err.code}, errMes: ${err.message}`)
    expect(err.code).assertEqual(1600013)
  })

  await sleep(500)
  notificationManager.requestEnableNotification(CustomGlobal.context, (err) => {
    console.error(`requestEnableNotification2 failed, code is ${err.code}, message is ${err.message}`);
    expect(err.code).assertEqual(1600013)
  });

  await sleep(500)
  notificationManager.requestEnableNotification(CustomGlobal.context).then(() => {
    console.info(`${TAG} requestEnableNotification Promise success`)
    expect(false).assertTrue()
    done()
  }).catch(async (err: BusinessError) => {
    console.info(`${TAG} requestEnableNotification2 Promise err: ${err.code}, errMes: ${err.message}`)
    expect(err.code).assertEqual(1600013)
  });

  await sleep(1000)
  let driver = Driver.create();
  await sleep(500)
  let button = await driver.findComponent(ON.text("允许",0));
  hilog.info(0x0000, 'testTag', `button is ${JSON.stringify(button)}`);
  await sleep(500);
  if (button !== null) {
    console.log('button not is null')
    await button.click();
    console.log('button not click')
    await sleep(500);
  } else {
    console.log(`button is null`)
  }
  console.info(`button is success`)

  let  index1 = 0;
  let publishCallback = (err: BusinessError): void => {
    index1+=1
    console.info(`index1:` + index1)
    if (index1 == 11){
      console.info(`fail in publishing notification:` + err.code)
      expect(err.code).assertEqual(1600009);
      done()
    }else {
      console.info(`publishing notification:` + err)
      expect(err).assertEqual(null);
    }
  }

  for (let index = 0; index <= 10; index++) {
    let notificationRequest: notificationManager.NotificationRequest = {
      id: index,
      content: {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: 'text_title',
          text: 'text_text',
          additionalText: 'test_Publish'
        }
      }
    }
    notificationManager.publish(notificationRequest, publishCallback)
    await sleep(60)
  }

  for (let index = 0; index <= 10; index++) {
    let notificationRequest: notificationManager.NotificationRequest = {
      id: index,
      content: {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: 'text_title',
          text: 'text_text',
          additionalText: 'test_Publish'
        }
      }
    }
    await notificationManager.publish(notificationRequest).then(() => {
      console.info(`${TAG} publish Promise success`)
      expect(true).assertTrue()
    }).catch(async (err: BusinessError) => {
      console.info(`${TAG} publish Promise err: ${err.code}, errMes: ${err.message}`)
      if (index == 10) {
        expect(err.code).assertEqual(1600009)
        done()
      }else {
        expect(false).assertTrue()
        done()
      }
    });
  }

})

    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_7900_283
     * @tc.name: commonEventManager.publish
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_7900_283', Level.LEVEL2, async (done: () => void) => {
      notificationManager.openNotificationSettings(CustomGlobal.context).then(async () => {
        expect(true).assertTrue();
        await sleep(2000)
        await notificationManager.openNotificationSettings(CustomGlobal.context).then(() => {
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + "openNotificationSettings: " + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          } else {
            expect(err.code).assertEqual(1600018)
            done()
          }
        });
      }).catch((err: BusinessError) => {
        console.error(TAG + "openNotificationSettings: " + JSON.stringify(err));
        if (err.code == 801) {
          expect(true).assertTrue();
          done();
        } else {
          expect(err.code).assertEqual(1600001)
          done();
        }
      });
    })


    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_7900_287
     * @tc.name: commonEventManager.publish
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_7900_287', Level.LEVEL2, async (done: Function) => {

      let BundleOption: notification.BundleOption = {
        bundle: "com.example.secondaryDirectory",
        uid: 101001
      }
      console.info(`${TAG} BundleOption bundle:uid = ${BundleOption.bundle}${BundleOption.uid}`);
      expect(typeof BundleOption.bundle == 'string').assertTrue()
      expect(typeof BundleOption.uid == 'number').assertTrue()
      expect(BundleOption.bundle).assertEqual("com.example.secondaryDirectory")
      expect(BundleOption.uid).assertEqual(101001)
      console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_7900_287 END`);


      let removeCallback = (err: BusinessError) => {
        if (err.code) {
          console.info("remove failed " + JSON.stringify(err));
          expect(err.code).assertEqual(67108878)
          done()
        } else {
          console.info("whwhwhremove success");
          expect(false).assertEqual(true)
          done()
        }
      }
      let bundle: notification.BundleOption = {
        bundle: "bundleName1",
      };
      let notificationKey: notification.NotificationKey = {
        id: 0,
        label: "label",
      };
      let reason: notification.RemoveReason = notification.RemoveReason.CLICK_REASON_REMOVE;
      notification.remove(bundle, notificationKey, reason, removeCallback);
    });

    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_7900_288
     * @tc.name: Sub_Notification_Ces_Publish_CommonEvent_7900_288
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_7900_288', Level.LEVEL2, async (done: Function) => {

      const TEST_SUITE_NAME = 'Sub_Notification'
      const TEST_CASE_NAME = 'Sub_Notification_Ces_Publish_CommonEvent_7900_287'
      let imagesource = image.createImageSource(getContext()
        .resourceManager
        .getMediaContentSync($r("app.media.icon"))
        .buffer
        .slice(0));
      const pixelMap = await imagesource.createPixelMap();
      let wantAgentData = wantAgent.getWantAgent({
        wants: [
          {
            bundleName: 'com.example.systemAPI',
            action: "usual.event.REMOVAL_WANTAGENT"
          }
        ],
        actionType: 4,
        requestCode: 0,
        actionFlags: [wantAgent.WantAgentFlags.ONE_TIME_FLAG]
      });

      console.log('Succeeded in creating pixelmap.');
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          longText: {
            title: '',
            text: 'test_text',
            additionalText: 'text_additionalText',
            longText: 'text_longText',
            briefText: 'text_briefText',
            expandedTitle: 'text_exoandTitle'
          }
        },
        smallIcon: pixelMap,
        largeIcon: pixelMap,
        groupName: "123",
        removalWantAgent: wantAgentData,
        badgeNumber: 99,
        notificationFlags: {
          soundEnabled: 0,
          vibrationEnabled: 1
        }
      }

      try {
        notificationManager.publish(notificationRequest, (err) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is :%{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
        done();
      }

    });


}) 
} 