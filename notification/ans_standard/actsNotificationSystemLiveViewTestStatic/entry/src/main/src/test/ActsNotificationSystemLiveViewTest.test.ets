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
import { describe , it, expect, Level, TestType, Size } from '../../../hypium/index'
import notificationManager from '@ohos.notificationManager'
import image from '@ohos.multimedia.image';
import {BusinessError} from '@ohos.base';
import hilog from '@ohos.hilog';
import WantAgent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';

let bundleName: string = 'com.example.systemliveView.static'
const TAG = 'NotificationActs'
const TEST_SUITE_NAME = 'testNotificationLiveNotification'
export default function ActsNotificationSystemLiveViewTest() {
  describe('ActsNotificationSystemLiveViewTest', () => {
    ///*
    // * @tc.number: Sub_Notification_Ans_Live_Publish_Static_2200
    // * @tc.name: Sub_Notification_Ans_Live_Publish_Static_2200
    // * @tc.desc: test publish interface fail
    // * @tc.size: LargeTest
    // * @tc.type: Function
    // * @tc.level Level 3
    // */
    //问题单号：DTS2025060627133
    // it(' Sub_Notification_Ans_Live_Publish_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   const TEST_CASE_NAME = 'testLiveNotificationCapsuleTitleForNull'
    //   const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4
    //   let opts : image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
    //
    //   let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
    //
    //   await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
    //     console.info(`${TAG}  Sub_Notification_Ans_Live_Publish_2200 pixelMap: ${pixelMap}`);
    //     console.log('Succeeded in creating pixelmap.');
    //   })
    //     let notificationRequest : notificationManager.NotificationRequest = {
    //       id : 1,
    //       notificationSlotType : notificationManager.SlotType.LIVE_VIEW,
    //       content : {
    //         notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //         systemLiveView : {
    //           title : 'title',
    //           text : 'text',
    //           typeCode : 1,
    //           capsule : {
    //             title :null,
    //             backgroundColor : 'back',
    //             icon : pixelMap
    //           }as notificationManager.NotificationCapsule,
    //           button : {
    //             names : ['name1','name2'],
    //             icons : [pixelMap,pixelMap],
    //             iconsResource : [{bundleName:'iconsResource1',moduleName:'iconsResource1',id:1},
    //               {bundleName:'iconsResource2',moduleName:'iconsResource2',id:2}]
    //           }as notificationManager.NotificationButton,
    //           time : {
    //             initialTime : 100,
    //             isCountDown : true,
    //             isPaused : true,
    //             isInTitle : true,
    //           }as notificationManager.NotificationTime,
    //           progress : {
    //             maxValue : 100,
    //             currentValue : 200,
    //             isPercentage : true
    //           }as notificationManager.NotificationProgress,
    //         }as notificationManager.NotificationSystemLiveViewContent,
    //       }as notificationManager.NotificationContent,
    //       creatorBundleName: "creatorBundleName",
    //       creatorUid: 100,
    //       creatorPid: 101,
    //       creatorUserId: 100,
    //       hashCode: "hashCode",
    //       source: 0,
    //       deviceId: undefined,
    //       notificationFlags: undefined,
    //       agentBundle: undefined,
    //       appInstanceKey: undefined,
    //     }
    //     try {
    //       hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
    //       notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
    //         if (err) {
    //           hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
    //           expect(true).assertTrue();
    //           hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //           done();
    //         }else{
    //           hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
    //           expect(false).assertTrue();
    //           hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //           done();
    //         }
    //       })
    //     } catch (error:BusinessError) {
    //       hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
    //       expect(error.code).assertEqual(401);
    //       hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //       done();
    //     }
    //
    // })

    /*
     * @tc.number: Sub_Notification_Ans_Live_Publish_Static_2300
     * @tc.name: Sub_Notification_Ans_Live_Publish_Static_2300
     * @tc.desc: test publish interface fail
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level Level 2
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleTitleForUndefined'
      const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4
      let opts : image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

      await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) =>{
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 pixelMap: ${pixelMap}`);
        console.log('Succeeded in creating pixelmap.');
      })

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
            }as notificationManager.NotificationCapsule,
            button : {
              names : ['name1','name2'],
              icons : [pixelMap,pixelMap]
            }as notificationManager.NotificationButton,
            time : {
              initialTime : 100,
              isCountDown : true,
              isPaused : true,
              isInTitle : true,
            }as notificationManager.NotificationTime,
            progress : {
              maxValue : 100,
              currentValue : 200,
              isPercentage : true
            }as notificationManager.NotificationProgress,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case start`);
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(true).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error:BusinessError) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(error));
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    ///*
    // * @tc.number: Sub_Notification_Ans_Live_Publish_Static_2600
    // * @tc.name: Sub_Notification_Ans_Live_Publish_Static_2600
    // * @tc.desc: test publish interface fail
    // * @tc.size: LargeTest
    // * @tc.type: Function
    // * @tc.level Level 2
    // */
    //问题单号：DTS2025060627133
    // it('Sub_Notification_Ans_Live_Publish_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>{
    //   const TEST_CASE_NAME = 'testLiveNotificationCapsuleIconForNull'
    //   let notificationRequest : notificationManager.NotificationRequest = {
    //     id : 1,
    //     content : {
    //       notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //       systemLiveView : {
    //         title : 'title',
    //         text : 'text',
    //         typeCode : 0,
    //         capsule : {
    //           title : 'text',
    //           icon : null
    //         }as notificationManager.NotificationCapsule,
    //       }as notificationManager.NotificationSystemLiveViewContent,
    //     }as notificationManager.NotificationContent,
    //     creatorBundleName: "creatorBundleName",
    //     creatorUid: 100,
    //     creatorPid: 101,
    //     creatorUserId: 100,
    //     hashCode: "hashCode",
    //     source: 0,
    //     deviceId: undefined,
    //     notificationFlags: undefined,
    //     agentBundle: undefined,
    //     appInstanceKey: undefined,
    //   }
    //   try {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
    //     notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
    //       if (err) {
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }else{
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }
    //     })
    //   } catch (error) {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     expect(true).assertTrue();
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     done();
    //   }
    // })

    /*
     * @tc.number: Sub_Notification_Ans_Live_Publish_Static_2700
     * @tc.name: Sub_Notification_Ans_Live_Publish_Static_2700
     * @tc.desc: test publish interface fail
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
            }as notificationManager.NotificationCapsule,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error:BusinessError) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }

    })

    /*
     * @tc.number: Sub_Notification_Ans_Live_Publish_Static_3100
     * @tc.name: Sub_Notification_Ans_Live_Publish_Static_3100
     * @tc.desc: test publish interface fail
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    //问题单号：DTS2025060627133
    // it('Sub_Notification_Ans_Live_Publish_Static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   const TEST_CASE_NAME = 'testLiveNotificationCapsuleBackgroundColorForNull'
    //   let notificationRequest : notificationManager.NotificationRequest = {
    //     id : 1,
    //     content : {
    //       notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //       systemLiveView : {
    //         title : 'title',
    //         text : 'text',
    //         typeCode : 0,
    //         capsule : {
    //           title : 'text',
    //           backgroundColor : null
    //         }as notificationManager.NotificationCapsule,
    //       }as notificationManager.NotificationSystemLiveViewContent,
    //     }as notificationManager.NotificationContent,
    //     creatorBundleName: "creatorBundleName",
    //     creatorUid: 100,
    //     creatorPid: 101,
    //     creatorUserId: 100,
    //     hashCode: "hashCode",
    //     source: 0,
    //     deviceId: undefined,
    //     notificationFlags: undefined,
    //     agentBundle: undefined,
    //     appInstanceKey: undefined,
    //   }
    //   try {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
    //     notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
    //       if (err) {
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }else{
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }
    //     })
    //   } catch (error) {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     expect(true).assertTrue();
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     done();
    //   }
    //
    // })

    /*
      * @tc.number: Sub_Notification_Ans_Live_Publish_Static_3200
      * @tc.name: Sub_Notification_Ans_Live_Publish_Static_3200
      * @tc.desc: test publish interface fail
      * @tc.size: LargeTest
      * @tc.type: Function
      * @tc.level Level 3
      */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
            }as notificationManager.NotificationCapsule,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }

    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_3900
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_3900
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    // it('Sub_Notification_Ans_Live_Publish_Static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   const TEST_CASE_NAME = 'testLiveNotificationButtonNamesForNull'
    //   let notificationRequest : notificationManager.NotificationRequest = {
    //     id : 1,
    //     content : {
    //       notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //       systemLiveView : {
    //         title : 'title',
    //         text : 'text',
    //         typeCode : 0,
    //         capsule : {
    //           title : 'text',
    //         }as notificationManager.NotificationCapsule,
    //         button : {
    //           names : null
    //         }as notificationManager.NotificationButton,
    //       }as notificationManager.NotificationSystemLiveViewContent,
    //     }as notificationManager.NotificationContent,
    //     creatorBundleName: "creatorBundleName",
    //     creatorUid: 100,
    //     creatorPid: 101,
    //     creatorUserId: 100,
    //     hashCode: "hashCode",
    //     source: 0,
    //     deviceId: undefined,
    //     notificationFlags: undefined,
    //     agentBundle: undefined,
    //     appInstanceKey: undefined,
    //   }
    //   try {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
    //     notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
    //       if (err) {
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }else{
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }
    //     })
    //   } catch (error) {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
    //     expect(true).assertTrue();
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     done();
    //   }
    // })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_4000
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_4000
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
            }as notificationManager.NotificationCapsule,
            button : {
              names : undefined
            }as notificationManager.NotificationButton,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(error));
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }

    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_4300
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_4300
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    // it('Sub_Notification_Ans_Live_Publish_Static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   const TEST_CASE_NAME = 'testLiveNotificationButtonIconsForNull'
    //   let notificationRequest : notificationManager.NotificationRequest = {
    //     id : 1,
    //     content : {
    //       notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //       systemLiveView : {
    //         title : 'title',
    //         text : 'text',
    //         typeCode : 0,
    //         capsule : {
    //           title : 'title'
    //         }as notificationManager.NotificationCapsule,
    //         button : {
    //           icons : null
    //         }as notificationManager.NotificationButton,
    //       }as notificationManager.NotificationSystemLiveViewContent,
    //     }as notificationManager.NotificationContent,
    //     creatorBundleName: "creatorBundleName",
    //     creatorUid: 100,
    //     creatorPid: 101,
    //     creatorUserId: 100,
    //     hashCode: "hashCode",
    //     source: 0,
    //     deviceId: undefined,
    //     notificationFlags: undefined,
    //     agentBundle: undefined,
    //     appInstanceKey: undefined,
    //   }
    //   try {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
    //     notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
    //       if (err) {
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }else{
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
    //         done();
    //       }
    //     })
    //   } catch (error) {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     expect(true).assertTrue();
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     done();
    //   }
    // })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_4400
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_4400
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
            }as notificationManager.NotificationCapsule,
            button : {
              icons : undefined
            }as notificationManager.NotificationButton,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    // /*
    // * @tc.number: Sub_Notification_Ans_Live_Publish_Static_5000
    // * @tc.name: Sub_Notification_Ans_Live_Publish_Static_5000
    // * @tc.desc: test publish interface fail
    // * @tc.size: LargeTest
    // * @tc.type: Function
    // * @tc.level Level 3
    // */
    //问题单号：DTS2025060627133
    // it('Sub_Notification_Ans_Live_Publish_Static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   const TEST_CASE_NAME = 'testLiveNotificationTimeinitialTimeForNull'
    //   let notificationRequest : notificationManager.NotificationRequest = {
    //     id : 1,
    //     content : {
    //       notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //       systemLiveView : {
    //         title : 'title',
    //         text : 'text',
    //         typeCode : 0,
    //         capsule : {
    //           title : 'title'
    //         }as notificationManager.NotificationCapsule,
    //         button : {
    //           names : ["button1"]
    //         }as notificationManager.NotificationButton,
    //         time : {
    //           initialTime : null
    //         }as notificationManager.NotificationTime,
    //       }as notificationManager.NotificationSystemLiveViewContent,
    //   }as notificationManager.NotificationContent,
    //     creatorBundleName: "creatorBundleName",
    //     creatorUid: 100,
    //     creatorPid: 101,
    //     creatorUserId: 100,
    //     hashCode: "hashCode",
    //     source: 0,
    //     deviceId: undefined,
    //     notificationFlags: undefined,
    //     agentBundle: undefined,
    //     appInstanceKey: undefined,
    //   }
    //   try {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
    //     notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
    //       if (err) {
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }else{
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
    //         done();
    //       }
    //     })
    //   } catch (error) {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     expect(true).assertTrue();
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     done();
    //   }
    // })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_5100
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_5100
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>{
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
            }as notificationManager.NotificationCapsule,
            button : {
              names : ["button1"]
            }as notificationManager.NotificationButton,
            time : {
              initialTime : undefined
            }as notificationManager.NotificationTime,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_5300
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_5300
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    // it('Sub_Notification_Ans_Live_Publish_Static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   const TEST_CASE_NAME = 'testLiveNotificationTimeisCountdownForNull'
    //   let notificationRequest : notificationManager.NotificationRequest = {
    //     id : 1,
    //     content : {
    //       notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //       systemLiveView : {
    //         title : 'title',
    //         text : 'text',
    //         typeCode : 0,
    //         capsule : {
    //           title : 'title'
    //         }as notificationManager.NotificationCapsule,
    //         button : {
    //           names : ["button1"]
    //         }as notificationManager.NotificationButton,
    //         time : {
    //           isCountDown : null
    //         }as notificationManager.NotificationTime,
    //       }as notificationManager.NotificationSystemLiveViewContent,
    //     }as notificationManager.NotificationContent,
    //     creatorBundleName: "creatorBundleName",
    //     creatorUid: 100,
    //     creatorPid: 101,
    //     creatorUserId: 100,
    //     hashCode: "hashCode",
    //     source: 0,
    //     deviceId: undefined,
    //     notificationFlags: undefined,
    //     agentBundle: undefined,
    //     appInstanceKey: undefined,
    //   }
    //   try {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
    //     notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
    //       if (err) {
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }else{
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
    //         done();
    //       }
    //     })
    //   } catch (error) {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     expect(true).assertTrue();
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     done();
    //   }
    // })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_5400
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_5400
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
            }as notificationManager.NotificationCapsule,
            button : {
              names : ["button1"]
            }as notificationManager.NotificationButton,
            time : {
              isCountDown : undefined
            }as notificationManager.NotificationTime,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_5600
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_5600
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    // it('Sub_Notification_Ans_Live_Publish_Static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   const TEST_CASE_NAME = 'testLiveNotificationTimeisPausedForNull'
    //   let notificationRequest : notificationManager.NotificationRequest = {
    //     id : 1,
    //     content : {
    //       notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //       systemLiveView : {
    //         title : 'title',
    //         text : 'text',
    //         typeCode : 0,
    //         capsule : {
    //           title : 'title'
    //         }as notificationManager.NotificationCapsule,
    //         button : {
    //           names : ["button1"]
    //         }as notificationManager.NotificationButton,
    //         time : {
    //           isCountDown : true,
    //           isPaused : null
    //         }as notificationManager.NotificationTime,
    //       }as notificationManager.NotificationSystemLiveViewContent,
    //   }as notificationManager.NotificationContent,
    //     creatorBundleName: "creatorBundleName",
    //     creatorUid: 100,
    //     creatorPid: 101,
    //     creatorUserId: 100,
    //     hashCode: "hashCode",
    //     source: 0,
    //     deviceId: undefined,
    //     notificationFlags: undefined,
    //     agentBundle: undefined,
    //     appInstanceKey: undefined,
    //   }
    //   try {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
    //     notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
    //       if (err) {
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }else{
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
    //         done();
    //       }
    //     })
    //   } catch (error) {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     expect(true).assertTrue();
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     done();
    //   }
    // })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_5700
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_5700
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
            }as notificationManager.NotificationCapsule,
            button : {
              names : ["button1"]
            }as notificationManager.NotificationButton,
            time : {
              isCountDown : true,
              isPaused : undefined
            }as notificationManager.NotificationTime,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success+data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_5900
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_5900
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    // it('Sub_Notification_Ans_Live_Publish_Static_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
    //   const TEST_CASE_NAME = 'testLiveNotificationTimeisInTitleForNull'
    //   let notificationRequest : notificationManager.NotificationRequest = {
    //     id : 1,
    //     content : {
    //       notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //       systemLiveView : {
    //         title : 'title',
    //         text : 'text',
    //         typeCode : 0,
    //         capsule : {
    //           title : 'title'
    //         }as notificationManager.NotificationCapsule,
    //         button : {
    //           names : ["button1"]
    //         }as notificationManager.NotificationButton,
    //         time : {
    //           isCountDown : true,
    //           isInTitle : null
    //         }as notificationManager.NotificationTime,
    //       }as notificationManager.NotificationSystemLiveViewContent,
    //     }as notificationManager.NotificationContent,
    //     creatorBundleName: "creatorBundleName",
    //     creatorUid: 100,
    //     creatorPid: 101,
    //     creatorUserId: 100,
    //     hashCode: "hashCode",
    //     source: 0,
    //     deviceId: undefined,
    //     notificationFlags: undefined,
    //     agentBundle: undefined,
    //     appInstanceKey: undefined,
    //   }
    //   try {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
    //     notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
    //       if (err) {
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }else{
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
    //         done();
    //       }
    //     })
    //   } catch (error) {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     expect(true).assertTrue();
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     done();
    //   }
    // })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_6000
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_6000
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
            }as notificationManager.NotificationCapsule,
            button : {
              names : ["button1"]
            }as notificationManager.NotificationButton,
            time : {
              isCountDown : true,
              isInTitle : undefined
            }as notificationManager.NotificationTime,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success+data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_6500
    * @tc.name: Sub_Notification_Ans_Live_Publish_6500
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    // it('testLiveNotificationProgressMaxvalueForNull', Level.LEVEL2, async (done : Function) => {
    //   const TEST_CASE_NAME = 'testLiveNotificationProgressMaxvalueForNull'
    //   let notificationRequest : notificationManager.NotificationRequest = {
    //     id : 1,
    //     content : {
    //       notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //       systemLiveView : {
    //         title : 'title',
    //         text : 'text',
    //         typeCode : 0,
    //         capsule : {
    //           title : 'title'
    //         },
    //         button : {
    //           names : ["button1"]
    //         },
    //         time : {
    //           isCountDown : true,
    //           isInTitle : true,
    //           isPaused : true
    //         },
    //         progress : {
    //           maxValue : null
    //         }
    //       }
    //     }
    //   }
    //   try {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
    //     notificationManager.publish(notificationRequest,(err: BusinessError | null,data) => {
    //       if (err) {
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //         done();
    //       }else{
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
    //         expect(false).assertTrue();
    //         hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
    //         done();
    //       }
    //     })
    //   } catch (error) {
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     expect(true).assertTrue();
    //     hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //     done();
    //   }
    // })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_6600
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_6600
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>{
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
            }as notificationManager.NotificationCapsule,
            button : {
              names : ["button1"]
            }as notificationManager.NotificationButton,
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            }as notificationManager.NotificationTime,
            progress : {
              maxValue : undefined
            }as notificationManager.NotificationProgress,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success+data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    ///*
    //* @tc.number: Sub_Notification_Ans_Live_Publish_Static_6900
    //* @tc.name: Sub_Notification_Ans_Live_Publish_Static_6900
    //* @tc.desc: test publish interface fail
    //* @tc.size: LargeTest
    //* @tc.type: Function
    //* @tc.level Level 3
    //*/
    //问题单号：DTS2025060627133
    //  it('Sub_Notification_Ans_Live_Publish_Static_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>{
    //    const TEST_CASE_NAME = 'testLiveNotificationProgressCurrentValueForNull'
    //    let notificationRequest : notificationManager.NotificationRequest = {
    //      id : 1,
    //      content : {
    //        notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //        systemLiveView : {
    //          title : 'title',
    //          text : 'text',
    //          typeCode : 0,
    //          capsule : {
    //            title : 'title'
    //          },
    //          button : {
    //            names : ["button1"]
    //          },
    //          time : {
    //            isCountDown : true,
    //            isInTitle : true,
    //            isPaused : true
    //          },
    //          progress : {
    //            maxValue : 50,
    //            currentValue : null
    //          }
    //        }
    //      }
    //    }
    //    try {
    //      hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case start`)
    //      notificationManager.publish(notificationRequest,(err: BusinessError | null,data) => {
    //        if (err) {
    //          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
    //          expect(false).assertTrue();
    //          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
    //          done();
    //        }else{
    //          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success,data is %{public}s`+JSON.stringify(data));
    //          expect(false).assertTrue();
    //          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`)
    //          done();
    //        }
    //      })
    //    } catch (error) {
    //      hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
    //      expect(true).assertTrue();
    //      hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
    //      done();
    //    }
    //  })

    /*
   * @tc.number: Sub_Notification_Ans_Live_Publish_Static_7000
   * @tc.name: Sub_Notification_Ans_Live_Publish_Static_7000
   * @tc.desc: test publish interface fail
   * @tc.size: LargeTest
   * @tc.type: Function
   * @tc.level Level 3
   */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>{
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
            }as notificationManager.NotificationCapsule,
            button : {
              names : ["button1"]
            }as notificationManager.NotificationButton,
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            }as notificationManager.NotificationTime,
            progress : {
              maxValue : 50,
              currentValue : undefined
            }as notificationManager.NotificationProgress,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
  * @tc.number: Sub_Notification_Ans_Live_Publish_Static_7300
  * @tc.name: Sub_Notification_Ans_Live_Publish_Static_7300
  * @tc.desc: test publish interface fail
  * @tc.size: LargeTest
  * @tc.type: Function
  * @tc.level Level 3
  */
    //问题单号：DTS2025060627133
    //   it('testLiveNotificationProgressisPercentageForNull', Level.LEVEL2, async (done : Function) => {
    //     const TEST_CASE_NAME = 'testLiveNotificationProgressisPercentageForNull'
    //     let notificationRequest : notificationManager.NotificationRequest = {
    //       id : 1,
    //       content : {
    //         notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
    //         systemLiveView : {
    //           title : 'title',
    //           text : 'text',
    //           typeCode : 0,
    //           capsule : {
    //             title : 'title'
    //           },
    //           button : {
    //             names : ["button1"]
    //           },
    //           time : {
    //             isCountDown : true,
    //             isInTitle : true,
    //             isPaused : true
    //           },
    //           progress : {
    //             maxValue : 50,
    //             isPercentage : null
    //           }
    //         }
    //       }
    //     }
    //     try {
    //       hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
    //       notificationManager.publish(notificationRequest,(err: BusinessError | null,data) => {
    //         if (err) {
    //           hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
    //           expect(false).assertTrue();
    //           hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //           done();
    //         }else{
    //           hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`,JSON.stringify(data));
    //           expect(false).assertTrue();
    //           hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
    //           done();
    //         }
    //       })
    //     } catch (error) {
    //       hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //       expect(true).assertTrue();
    //       hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
    //       done();
    //     }
    //   })


    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_Static_7400
    * @tc.name: Sub_Notification_Ans_Live_Publish_Static_7400
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
            }as notificationManager.NotificationCapsule,
            button : {
              names : ["button1"]
            }as notificationManager.NotificationButton,
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            }as notificationManager.NotificationTime,
            progress : {
              maxValue : 50,
              isPercentage : undefined
            }as notificationManager.NotificationProgress,
          }as notificationManager.NotificationSystemLiveViewContent,
        }as notificationManager.NotificationContent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case start`);
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success+data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
  * @tc.number: Sub_Notification_Ans_Live_Publish_Static_7500
  * @tc.name: Sub_Notification_Ans_Live_Publish_Static_7500
  * @tc.desc: test publish interface fail
  * @tc.size: LargeTest
  * @tc.type: Function
  * @tc.level Level 3
  */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'Sub_Notification_Ans_Live_Publish_Static_7500'
      const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4
      let opts : image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }

      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

      await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) =>{
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 pixelMap: ${pixelMap}`);
        console.log('Succeeded in creating pixelmap.');
      })

      let parameters1 : Record<String,Object> = {
        "mykey0": 2222,
        "mykey1": [1, 2, 3],
        "mykey2": "[1, 2, 3]",
        "mykey3": "ssssssssssssssssssssssssss",
        "mykey4": [false, true, false],
        "mykey5": ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
        "mykey6": true,
      }

      //wantAgent对象
      let wantAgent: Object = {};
      //WantAgentInfo对象
      let wantAgentInfo: WantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: 'deviceId',
            bundleName: bundleName,
            abilityName: 'EntryAbility',
            action: 'action1',
            entities: ['entity1'],
            type: 'MIMETYPE',
            uri: 'key={true,true,false}',
            parameters:parameters1
          }
        ],
        actionType : WantAgent.OperationType.START_ABILITY,
        actionFlags : [WantAgent.WantAgentFlags.ONE_TIME_FLAG]
      };

      try {
        WantAgent.getWantAgent(wantAgentInfo).then((data) => {
          wantAgent = data;
        }).catch((err: BusinessError) :void => {
          console.error('getWantAgent failed! ${err.code} ${err.message}');
        });
      } catch (err: BusinessError) {
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
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
          systemLiveView : content
        }as notificationManager.NotificationContent,
        wantAgent : wantAgent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey:undefined,
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case start`);
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(true).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success+data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error:BusinessError) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(error));
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }

    })
    /*
      * @tc.number: Sub_Notification_Ans_Live_Publish_Static_7600
      * @tc.name: Sub_Notification_Ans_Live_Publish_Static_7600
      * @tc.desc: test publish interface fail
      * @tc.size: LargeTest
      * @tc.type: Function
      * @tc.level Level 3
      */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleTitleForUndefined'
      const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4
      let opts : image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }

      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

      await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) =>{
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 pixelMap: ${pixelMap}`);
        console.log('Succeeded in creating pixelmap.');
      })

      //wantAgent对象
      let wantAgent: Object;
      let parameters1 : Record<String,Object> = {
        "mykey0": 2222,
        "mykey1": [1, 2, 3],
        "mykey2": "[1, 2, 3]",
        "mykey3": "ssssssssssssssssssssssssss",
        "mykey4": [false, true, false],
        "mykey5": ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
        "mykey6": true,
      }

      //WantAgentInfo对象
      let wantAgentInfo: WantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: 'deviceId',
            bundleName: bundleName,
            abilityName: 'EntryAbility',
            action: 'action1',
            entities: ['entity1'],
            type: 'MIMETYPE',
            uri: 'key={true,true,false}',
            parameters: parameters1
          }
        ],
        actionType : WantAgent.OperationType.START_ABILITY,
        actionFlags : [WantAgent.WantAgentFlags.ONE_TIME_FLAG]
      };
      try {
        WantAgent.getWantAgent(wantAgentInfo).then((data) => {
          wantAgent = data;
        }).catch((err: BusinessError) :void => {
          console.error('getWantAgent failed! ${err.code} ${err.message}');
        });
      } catch (err: BusinessError) {
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
        }as notificationManager.NotificationContent,
        wantAgent : wantAgent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }

      // 通知slot对象
      let notificationSlot: notificationManager.NotificationSlot = {
        notificationType : notificationManager.SlotType.CUSTOMER_SERVICE,
        enabled: undefined,
        reminderMode: undefined,
        authorizedStatus: undefined
      };
      notificationManager.isNotificationEnabled().then((data: boolean) => {
        console.info("isNotificationEnabled success, data: " + JSON.stringify(data));
      }).catch((err: BusinessError) :void => {
        console.error(`isNotificationEnabled fail: ${JSON.stringify(err)}`);
      });
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`+JSON.stringify(err));
            expect(true).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error : BusinessError) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`+`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })


    /*
 * @tc.number: Sub_Notification_Ans_Live_Publish_Static_7700
 * @tc.name: Sub_Notification_Ans_Live_Publish_Static_7700
 * @tc.desc: test publish interface success
 * @tc.size: LargeTest
 * @tc.type: Function
 * @tc.level Level 3
 */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Live_Publish_Static_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleTitleForUndefined'
      const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4
      let opts : image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }

      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

      await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) =>{
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 pixelMap: ${pixelMap}`);
        console.log('Succeeded in creating pixelmap.');
      })

      //wantAgent对象
      let wantAgent: Object;
      let parameters1 : Record<String,Object> = {
        "mykey0": 2222,
        "mykey1": [1, 2, 3],
        "mykey2": "[1, 2, 3]",
        "mykey3": "ssssssssssssssssssssssssss",
        "mykey4": [false, true, false],
        "mykey5": ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
        "mykey6": true,
      }

      //WantAgentInfo对象
      let wantAgentInfo: WantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: 'deviceId',
            bundleName: bundleName,
            abilityName: 'EntryAbility',
            action: 'action1',
            entities: ['entity1'],
            type: 'MIMETYPE',
            uri: 'key={true,true,false}',
            parameters: parameters1
          }
        ],
        actionType : WantAgent.OperationType.START_ABILITY,
        actionFlags : [WantAgent.WantAgentFlags.ONE_TIME_FLAG]
      };
      try {
        WantAgent.getWantAgent(wantAgentInfo).then((data) => {
          wantAgent = data;
        }).catch((err: BusinessError) :void => {
          console.error('getWantAgent failed! ${err.code} ${err.message}');
        });
      } catch (err: BusinessError) {
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
        }as notificationManager.NotificationContent,
        wantAgent : wantAgent,
        creatorBundleName: "creatorBundleName",
        creatorUid: 100,
        creatorPid: 101,
        creatorUserId: 100,
        hashCode: "hashCode",
        source: 0,
        deviceId: undefined,
        notificationFlags: undefined,
        agentBundle: undefined,
        appInstanceKey: undefined,
      }
      // addslot回调
      let addSlotCallBack = (err: BusinessError | null) => {
        if (err) {
          console.info("addSlot failed " + JSON.stringify(err));
        } else {
          console.info("addSlot success");
        }
      }
      // 通知slot对象
      let notificationSlot: notificationManager.NotificationSlot = {
        notificationType : notificationManager.SlotType.CUSTOMER_SERVICE,
        enabled: undefined,
        reminderMode: undefined,
        authorizedStatus: undefined
      };
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
        notificationManager.publish(notificationRequest,(err: BusinessError | null) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(true).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error:BusinessError) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
        expect(error.code).assertEqual(401);
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }

    })

    /*
     * @tc.number: Sub_Notification_Ans_Enable_Query_Static_0200
     * @tc.name: Sub_Notification_Ans_Enable_Query_Static_0200
     * @tc.desc: test function isNotificationEnabled no parameter
     */
    it('Sub_Notification_Ans_Enable_Query_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_Query_Static_0200'
        console.info(`${TAG} Sub_Notification_Ans_Enable_Query_Static_0200 START`);

        notificationManager.isNotificationEnabled((err: BusinessError | null, data: boolean|undefined): void => {
          if (err) {
            console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} isNotificationEnabled AsyncCallback success ${data}`)
            expect(true).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Enable_Query_Static_0200 END`);
      })

  })
}
