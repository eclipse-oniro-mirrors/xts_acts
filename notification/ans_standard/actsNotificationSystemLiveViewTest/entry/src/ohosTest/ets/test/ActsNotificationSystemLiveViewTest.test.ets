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
import { describe , it, expect, Level } from '@ohos/hypium'
import notificationManager from '@ohos.notificationManager'
import image from '@ohos.multimedia.image';
import {BusinessError} from '@ohos.base';
import hilog from '@ohos.hilog';
import WantAgent, { WantAgent as _WantAgent} from '@ohos.app.ability.wantAgent';
import ohosWantAgent from '@ohos.wantAgent'
import Notification from '@ohos.notification';
import Want from '@ohos.app.ability.Want';
import base from '@ohos.base';
const TAG = 'NotificationActs'
const TEST_SUITE_NAME = 'testNotificationLiveNotification'
export default function ActsNotificationSystemLiveViewTest() {
  describe('testNotificationLiveNotification', async (done : Function) => {
    /**
     * @tc.name   testLiveNotificationCapsuleTitleForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_2200
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationCapsuleTitleForNull', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleTitleForNull'
      const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4
      let opts : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      image.createPixelMap(color, opts).then((pixelMap : image.PixelMap) => {
        console.log('Succeeded in creating pixelmap.');
        let notificationRequest : notificationManager.NotificationRequest = {
          id : 1,
          notificationSlotType : notificationManager.SlotType.LIVE_VIEW,
          content : {
            notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView : {
              title : 'title',
              text : 'text',
              typeCode : 1,
              capsule : {
                title : null,
                backgroundColor : 'back',
                icon : pixelMap
              },
              button : {
                names : ['name1','name2'],
                icons : [pixelMap,pixelMap],
                iconsResource : [{bundleName:'iconsResource1',moduleName:'iconsResource1',id:1},
                {bundleName:'iconsResource2',moduleName:'iconsResource2',id:2}]
              },
              time : {
                initialTime : 100,
                isCountDown : true,
                isPaused : true,
                isInTitle : true,
              },
              progress : {
                maxValue : 100,
                currentValue : 200,
                isPercentage : true
              }
            }
          }
        }
        try {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
          notificationManager.publish(notificationRequest,(err,data) => {
            if (err) {
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
              expect(err.code).assertEqual(401);
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }else{
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
              expect(false).assertTrue();
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
          expect(error.code).assertEqual(401);
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      }).catch((error : BusinessError) => {
        console.error('Failed to create pixelmap.');
      })
    })

    /**
     * @tc.name   testLiveNotificationCapsuleTitleForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_2300
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationCapsuleTitleForUndefined', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleTitleForUndefined'
      const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4
      let opts : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      image.createPixelMap(color, opts).then((pixelMap : image.PixelMap) => {
        console.log('Succeeded in creating pixelmap.');
        let notificationRequest : notificationManager.NotificationRequest = {
          id : 1,
          notificationSlotType : notificationManager.SlotType.LIVE_VIEW,
          content : {
            notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView : {
              title : 'title',
              text : 'text',
              typeCode : 1,
              capsule : {
                title : undefined,
                backgroundColor : 'back',
                icon : pixelMap
              },
              button : {
                names : ['name1','name2'],
                icons : [pixelMap,pixelMap]
              },
              time : {
                initialTime : 100,
                isCountDown : true,
                isPaused : true,
                isInTitle : true,
              },
              progress : {
                maxValue : 100,
                currentValue : 200,
                isPercentage : true
              }
            }
          },
          notificationFlags : {
            soundEnabled : 0,
            vibrationEnabled : 1
          }
        }
        try {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
          notificationManager.publish(notificationRequest,(err,data) => {
            if (err) {
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
              expect(err.code).assertEqual(401);
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }else{
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
              expect(false).assertTrue();
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
          expect(error.code).assertEqual(401);
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      }).catch((error : BusinessError) => {
        console.error('Failed to create pixelmap.');
      })
    })

    /**
     * @tc.name   testLiveNotificationCapsuleIconForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_2600
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationCapsuleIconForNull', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleIconForNull'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'text',
              icon : null
            }
          }
        },
        notificationFlags : {
          soundEnabled : 2,
          vibrationEnabled : 2
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationCapsuleIconForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_2700
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationCapsuleIconForUndefined', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleIconForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'text',
              icon : undefined
            }
          }
        },
        notificationFlags : {
          soundEnabled : 2,
          vibrationEnabled : 2
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }

    })

    /**
     * @tc.name   testLiveNotificationCapsuleBackgroundColorForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_3100
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationCapsuleBackgroundColorForNull', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleBackgroundColorForNull'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'text',
              backgroundColor : null
            }
          }
        },
        notificationFlags : {
          soundEnabled : 2,
          vibrationEnabled : 2
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }

    })

    /**
     * @tc.name   testLiveNotificationCapsuleBackgroundColorForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_3200
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationCapsuleBackgroundColorForUndefined', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleBackgroundColorForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'text',
              backgroundColor : undefined
            }
          }
        },
        notificationFlags : {
          soundEnabled : 2,
          vibrationEnabled : 2
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }

    })

    /**
     * @tc.name   testLiveNotificationButtonNamesForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_3900
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationButtonNamesForNull', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationButtonNamesForNull'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'text',
            },
            button : {
              names : null
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationCapsuleIconForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_4000
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationCapsuleIconForUndefined', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleIconForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'text',
            },
            button : {
              names : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }

    })

    /**
     * @tc.name   testLiveNotificationButtonIconsForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_4300
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationButtonIconsForNull', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationButtonIconsForNull'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              icons : null
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationButtonIconsForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_4400
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationButtonIconsForUndefined', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationButtonIconsForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              icons : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationTimeinitialTimeForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_5000
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationTimeinitialTimeForNull', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeinitialTimeForNull'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              initialTime : null
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationTimeinitialTimeForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_5100
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationTimeinitialTimeForUndefined', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeinitialTimeForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              initialTime : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationTimeisCountdownForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_5300
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationTimeisCountdownForNull', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeisCountdownForNull'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : null
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationTimeisCountdownForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_5400
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationTimeisCountdownForUndefined', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeisCountdownForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationTimeisPausedForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_5600
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationTimeisPausedForNull', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeisPausedForNull'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isPaused : null
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationTimeisPausedForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_5700
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationTimeisPausedForUndefined', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeisPausedForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isPaused : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationTimeisInTitleForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_5900
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationTimeisInTitleForNull', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeisInTitleForNull'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : null
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationTimeisInTitleForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_6000
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationTimeisInTitleForUndefined', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeisInTitleForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationProgressMaxvalueForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_6500
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationProgressMaxvalueForNull', Level.LEVEL2, async (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationProgressMaxvalueForNull'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            },
            progress : {
              maxValue : null
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationProgressMaxvalueForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_6600
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationProgressMaxvalueForUndefined', Level.LEVEL2, async (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationProgressMaxvalueForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            },
            progress : {
              maxValue : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationProgressCurrentValueForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_6900
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationProgressCurrentValueForNull', Level.LEVEL2, async (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationProgressCurrentValueForNull'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            },
            progress : {
              maxValue : 50,
              currentValue : null
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationProgressCurrentValueForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_7000
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationProgressCurrentValueForUndefined', Level.LEVEL2, async (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationProgressCurrentValueForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            },
            progress : {
              maxValue : 50,
              currentValue : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationProgressisPercentageForNull
     * @tc.number Sub_Notification_Ans_Live_Publish_7300
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationProgressisPercentageForNull', Level.LEVEL2, async (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationProgressisPercentageForNull'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            },
            progress : {
              maxValue : 50,
              isPercentage : null
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })


    /**
     * @tc.name   testLiveNotificationProgressisPercentageForUndefined
     * @tc.number Sub_Notification_Ans_Live_Publish_7400
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationProgressisPercentageForUndefined', Level.LEVEL2, async (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationProgressisPercentageForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            },
            progress : {
              maxValue : 50,
              isPercentage : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /**
     * @tc.name   testLiveNotificationPublishsuccess
     * @tc.number Sub_Notification_Ans_Live_Publish_7500
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationPublishsuccess', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleTitleForUndefined'
      const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4
      let opts : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      image.createPixelMap(color, opts).then((pixelMap : image.PixelMap) => {
        console.log('Succeeded in creating pixelmap.');
        //wantAgent对象
        let wantAgent: _WantAgent;
        //WantAgentInfo对象
        let wantAgentInfo: WantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: 'deviceId',
              bundleName: 'com.example.myapplication',
              abilityName: 'EntryAbility',
              action: 'action1',
              entities: ['entity1'],
              type: 'MIMETYPE',
              uri: 'key={true,true,false}',
              parameters:
              {
                mykey0: 2222,
                mykey1: [1, 2, 3],
                mykey2: '[1, 2, 3]',
                mykey3: 'ssssssssssssssssssssssssss',
                mykey4: [false, true, false],
                mykey5: ['qqqqq', 'wwwwww', 'aaaaaaaaaaaaaaaaa'],
                mykey6: true,
              }
            } as Want
          ],
          operationType: ohosWantAgent.OperationType.START_ABILITIES,
          requestCode: 0,
          wantAgentFlags:[WantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
          actionType : WantAgent.OperationType.START_ABILITY,
          actionFlags : [WantAgent.WantAgentFlags.ONE_TIME_FLAG]
        };
        try {
          WantAgent.getWantAgent(wantAgentInfo).then((data) => {
            wantAgent = data;
          }).catch((err: BusinessError) => {
            console.error('getWantAgent failed! ${err.code} ${err.message}');
          });
        } catch (err) {
          console.error('getWantAgent failed! ${err.code} ${err.message}');
        }
        let capsule : notificationManager.NotificationCapsule = {
          title : 'title',
          backgroundColor : 'back'
        }
        let button : notificationManager.NotificationButton = {
          names : ['name1','name2']
        }
        let time : notificationManager.NotificationTime = {
          initialTime : 100,
          isCountDown : undefined
        }
        let progresss : notificationManager.NotificationProgress = {
          isPercentage : true,
          currentValue : 100
        }
        let content : notificationManager.NotificationSystemLiveViewContent = {
          title: 'title',
          text : 'text',
          typeCode : 1,
          capsule : capsule,
          button : button,
          time : time,
          progress : progresss
        }
        let notificationRequest : notificationManager.NotificationRequest = {
          id : 1,
          notificationSlotType : notificationManager.SlotType.CUSTOMER_SERVICE,
          content  : {
            notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
            systemLiveView : content
          },
          wantAgent : wantAgent
        }
        try {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
          notificationManager.publish(notificationRequest,(err,data) => {
            if (err) {
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
              expect(err.code).assertEqual(401);
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }else{
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
              expect(false).assertTrue();
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
          expect(error.code).assertEqual(401);
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      }).catch((error : BusinessError) => {
        console.error('Failed to create pixelmap.');
      })
    })

    /**
     * @tc.name   testLiveNotificationPublishsuccess
     * @tc.number Sub_Notification_Ans_Live_Publish_7600
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationPublishsuccess', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleTitleForUndefined'
      const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4
      let opts : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      image.createPixelMap(color, opts).then((pixelMap : image.PixelMap) => {
        console.log('Succeeded in creating pixelmap.');
        //wantAgent对象
        let wantAgent: _WantAgent;
        //WantAgentInfo对象
        let wantAgentInfo: WantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: 'deviceId',
              bundleName: 'com.example.myapplication',
              abilityName: 'EntryAbility',
              action: 'action1',
              entities: ['entity1'],
              type: 'MIMETYPE',
              uri: 'key={true,true,false}',
              parameters:
              {
                mykey0: 2222,
                mykey1: [1, 2, 3],
                mykey2: '[1, 2, 3]',
                mykey3: 'ssssssssssssssssssssssssss',
                mykey4: [false, true, false],
                mykey5: ['qqqqq', 'wwwwww', 'aaaaaaaaaaaaaaaaa'],
                mykey6: true,
              }
            } as Want
          ],
          operationType: ohosWantAgent.OperationType.START_ABILITIES,
          requestCode: 0,
          wantAgentFlags:[WantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
          actionType : WantAgent.OperationType.START_ABILITY,
          actionFlags : [WantAgent.WantAgentFlags.ONE_TIME_FLAG]
        };
        try {
          WantAgent.getWantAgent(wantAgentInfo).then((data) => {
            wantAgent = data;
          }).catch((err: BusinessError) => {
            console.error('getWantAgent failed! ${err.code} ${err.message}');
          });
        } catch (err) {
          console.error('getWantAgent failed! ${err.code} ${err.message}');
        }
        let capsule : notificationManager.NotificationCapsule = {
          title : 'title',
          backgroundColor : 'back'
        }
        let button : notificationManager.NotificationButton = {
          names : ['name1','name2']
        }
        let time : notificationManager.NotificationTime = {
          initialTime : 100,
          isCountDown : undefined
        }
        let progresss : notificationManager.NotificationProgress = {
          isPercentage : true,
          currentValue : 100
        }
        let content : notificationManager.NotificationSystemLiveViewContent = {
          title: 'title',
          text : 'text',
          typeCode : 1,
          capsule : capsule,
          button : button,
          time : time,
          progress : progresss
        }
        let notificationRequest : notificationManager.NotificationRequest = {
          id : 1,
          notificationSlotType : notificationManager.SlotType.CUSTOMER_SERVICE,
          content  : {
            notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
            systemLiveView : content
          },
          wantAgent : wantAgent,
        }

        // 通知slot对象
        let notificationSlot: notificationManager.NotificationSlot = {
          notificationType : notificationManager.SlotType.CUSTOMER_SERVICE
        };
        notificationManager.isNotificationEnabled().then((data: boolean) => {
          console.info("isNotificationEnabled success, data: " + JSON.stringify(data));
        }).catch((err: base.BusinessError) => {
          console.error(`isNotificationEnabled fail: ${JSON.stringify(err)}`);
        });
        try {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
          notificationManager.publish(notificationRequest,(err,data) => {
            if (err) {
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
              expect(err.code).assertEqual(401);
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }else{
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
              expect(false).assertTrue();
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
          expect(error.code).assertEqual(401);
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      }).catch((error : BusinessError) => {
        console.error('Failed to create pixelmap.');
      })
    })

    /**
     * @tc.name   testLiveNotificationPublishsuccess
     * @tc.number Sub_Notification_Ans_Live_Publish_7700
     * @tc.desc   test publish interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLiveNotificationPublishsuccess', Level.LEVEL2, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleTitleForUndefined'
      const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4
      let opts : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      image.createPixelMap(color, opts).then((pixelMap : image.PixelMap) => {
        console.log('Succeeded in creating pixelmap.');
        //wantAgent对象
        let wantAgent: _WantAgent;
        //WantAgentInfo对象
        let wantAgentInfo: WantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: 'deviceId',
              bundleName: 'com.example.myapplication',
              abilityName: 'EntryAbility',
              action: 'action1',
              entities: ['entity1'],
              type: 'MIMETYPE',
              uri: 'key={true,true,false}',
              parameters:
              {
                mykey0: 2222,
                mykey1: [1, 2, 3],
                mykey2: '[1, 2, 3]',
                mykey3: 'ssssssssssssssssssssssssss',
                mykey4: [false, true, false],
                mykey5: ['qqqqq', 'wwwwww', 'aaaaaaaaaaaaaaaaa'],
                mykey6: true,
              }
            } as Want
          ],
          operationType: ohosWantAgent.OperationType.START_ABILITIES,
          requestCode: 0,
          wantAgentFlags:[WantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
          actionType : WantAgent.OperationType.START_ABILITY,
          actionFlags : [WantAgent.WantAgentFlags.ONE_TIME_FLAG]
        };
        try {
          WantAgent.getWantAgent(wantAgentInfo).then((data) => {
            wantAgent = data;
          }).catch((err: BusinessError) => {
            console.error('getWantAgent failed! ${err.code} ${err.message}');
          });
        } catch (err) {
          console.error('getWantAgent failed! ${err.code} ${err.message}');
        }
        let capsule : notificationManager.NotificationCapsule = {
          title : 'title',
          backgroundColor : 'back'
        }
        let button : notificationManager.NotificationButton = {
          names : ['name1','name2']
        }
        let time : notificationManager.NotificationTime = {
          initialTime : 100,
          isCountDown : undefined
        }
        let progresss : notificationManager.NotificationProgress = {
          isPercentage : true,
          currentValue : 100
        }
        let content : notificationManager.NotificationSystemLiveViewContent = {
          title: 'title',
          text : 'text',
          typeCode : 1,
          capsule : capsule,
          button : button,
          time : time,
          progress : progresss
        }
        let notificationRequest : notificationManager.NotificationRequest = {
          id : 1,
          notificationSlotType : notificationManager.SlotType.CUSTOMER_SERVICE,
          content  : {
            notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
            systemLiveView : content
          },
          wantAgent : wantAgent,
        }
        // addslot回调
        let addSlotCallBack = (err: base.BusinessError) => {
          if (err) {
            console.info("addSlot failed " + JSON.stringify(err));
          } else {
            console.info("addSlot success");
          }
        }
        // 通知slot对象
        let notificationSlot: notificationManager.NotificationSlot = {
          notificationType : notificationManager.SlotType.CUSTOMER_SERVICE
        };
        try {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
          notificationManager.publish(notificationRequest,(err,data) => {
            if (err) {
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
              expect(err.code).assertEqual(401);
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }else{
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
              expect(false).assertTrue();
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
          expect(error.code).assertEqual(401);
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      }).catch((error : BusinessError) => {
        console.error('Failed to create pixelmap.');
      })
    })

  })
}
