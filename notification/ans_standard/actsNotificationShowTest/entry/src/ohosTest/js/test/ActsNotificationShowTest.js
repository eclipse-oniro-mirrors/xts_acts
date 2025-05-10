/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import notification from '@system.notification'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

export default function ActsNotificationShowTest() {
  describe('SUB_NOTIFICATION_ANS_SHOW_TEST', function () {
    const TAG = 'SUB_NOTIFICATION_ANS_SHOW_TEST ===> '
    console.info(TAG + "SUB_NOTIFICATION_ANS_SHOW_TEST START")

    /*
    * @tc.number: Sub_Notification_Ans_Distributed_Enable_5300
    * @tc.name: show()
    * @tc.desc: verify the function of show
    */
    it('Sub_Notification_Ans_Distributed_Enable_5300', Level.LEVEL2, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Distributed_Enable_5300 START ')
      let ShowNotificationOptions = {
        contentTitle: 'Title1',
        contentText: 'This is a notification 001'
      }
      try {
        await notification.show(ShowNotificationOptions)
        console.info(TAG + ' conteneTitle:' + ShowNotificationOptions.contentTitle)
        console.info(TAG + ' contentText:' + ShowNotificationOptions.contentText)
        expect(ShowNotificationOptions.contentTitle).assertEqual('Title1')
        expect(ShowNotificationOptions.contentText).assertEqual('This is a notification 001')
        done()
      } catch (error) {
        console.error(`show fail: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(801)
        done()
      }
      try {
        await notification.show()
        expect(true).assertTrue()
        done()
      } catch (error) {
        console.error(`show fail: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(801)
        done()
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Distributed_Enable_5400
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('Sub_Notification_Ans_Distributed_Enable_5400', Level.LEVEL2, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Distributed_Enable_5400 START ')
      let ShowNotificationOptions = {
        contentTitle: 123,
        contentText: 'This is a notification 002'
      }
      try {
        await notification.show(ShowNotificationOptions)
        console.info(TAG + ' conteneTitle is number:' + ShowNotificationOptions.contentTitle)
        console.info(TAG + ' contentText:' + ShowNotificationOptions.contentText)
        expect(ShowNotificationOptions.contentText).assertEqual('This is a notification 002')
      } catch (error) {
        console.error(`show fail: ${JSON.stringify(error)}`);
        if(error.code == 801){
          expect(true).assertTrue()
          done()
        }else{
          expect(error.code).assertEqual(401)
          done()
        }
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Distributed_Enable_5500
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('Sub_Notification_Ans_Distributed_Enable_5500', Level.LEVEL2, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Distributed_Enable_5500 START ')
      let ShowNotificationOptions = {}
      try {
        await notification.show(ShowNotificationOptions)
        expect(ShowNotificationOptions.contentTitle).assertEqual(undefined)
        done()
      } catch (error) {
        console.error(`show fail: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(801)
        done()
      }
    
    })

    /*
     * @tc.number: Sub_Notification_Ans_Distributed_Enable_5600
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('Sub_Notification_Ans_Distributed_Enable_5600', Level.LEVEL2, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Distributed_Enable_5600 START ')
      let ActionResult = {
        bundleName: 'com.example.actsnotificationshow',
        abilityName: 'com.example.actsnotificationshow.MainAbility',
        uri: '/'
      }
      let ShowNotificationOptions = {
        contentTitle: 'Title4',
        contentText: 'This is a notification 004',
        clickAction: ActionResult
      }
      try {
        await notification.show(ShowNotificationOptions)
        console.info(TAG + ' conteneTitle:' + ShowNotificationOptions.contentTitle)
        console.info(TAG + ' contentText:' + ShowNotificationOptions.contentText)
        console.info(TAG + ' ActionResult bundleName:' + ShowNotificationOptions.clickAction.bundleName)
        console.info(TAG + ' ActionResult abilityName:' + ShowNotificationOptions.clickAction.abilityName)
        console.info(TAG + ' ActionResult uri:' + ShowNotificationOptions.clickAction.uri)
        expect(ShowNotificationOptions.contentTitle).assertEqual('Title4')
        expect(ShowNotificationOptions.contentText).assertEqual('This is a notification 004')
        expect(ShowNotificationOptions.clickAction.bundleName).assertEqual('com.example.actsnotificationshow')
        expect(ShowNotificationOptions.clickAction.abilityName).assertEqual('com.example.actsnotificationshow.MainAbility')
        expect(ShowNotificationOptions.clickAction.uri).assertEqual('/')
        done()
      } catch (error) {
        console.error(`show fail: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(801)
        done()
      }
    })

    /*
     * @tc.number: Sub_Notification_Ans_Distributed_Enable_5700
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('Sub_Notification_Ans_Distributed_Enable_5700', Level.LEVEL2, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Distributed_Enable_5700 START ')
      let ActionResult = {
        bundleName: 'com.example.actsnotificationshow',
        abilityName: 'com.example.actsnotificationshow.MainAbility',
        uri: 'pages/index/index'
      }
      let ShowNotificationOptions = {
        contentTitle: 'Title5',
        contentText: 'This is a notification 005',
        clickAction: ActionResult
      }
      try {
        await notification.show(ShowNotificationOptions)
        console.info(TAG + ' conteneTitle:' + ShowNotificationOptions.contentTitle)
        console.info(TAG + ' contentText:' + ShowNotificationOptions.contentText)
        console.info(TAG + ' ActionResult bundleName:' + ShowNotificationOptions.clickAction.bundleName)
        console.info(TAG + ' ActionResult abilityName:' + ShowNotificationOptions.clickAction.abilityName)
        console.info(TAG + ' ActionResult uri:' + ShowNotificationOptions.clickAction.uri)
        expect(ShowNotificationOptions.contentTitle).assertEqual('Title5')
        expect(ShowNotificationOptions.contentText).assertEqual('This is a notification 005')
        expect(ShowNotificationOptions.clickAction.bundleName).assertEqual('com.example.actsnotificationshow')
        expect(ShowNotificationOptions.clickAction.abilityName).assertEqual('com.example.actsnotificationshow.MainAbility')
        expect(ShowNotificationOptions.clickAction.uri).assertEqual('pages/index/index')
        done()
      } catch (error) {
        console.error(`show fail: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(801)
        done()
      }
    
    })

    /*
     * @tc.number: Sub_Notification_Ans_Distributed_Enable_5800
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('Sub_Notification_Ans_Distributed_Enable_5800', Level.LEVEL2, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Distributed_Enable_5800 START ')
      let ActionResult = {
        bundleName: '',
        abilityName: 'com.example.actsnotificationshow.MainAbility',
        uri: '/',
      }
      let ShowNotificationOptions = {
        contentTitle: 'Title6',
        contentText: 'This is a notification 006',
        clickAction: ActionResult
      }
      try {
        await notification.show(ShowNotificationOptions)
        console.info(TAG + ' conteneTitle:' + ShowNotificationOptions.contentTitle)
        console.info(TAG + ' contentText:' + ShowNotificationOptions.contentText)
        console.info(TAG + ' ActionResult bundleName:' + ShowNotificationOptions.clickAction.bundleName)
        console.info(TAG + ' ActionResult abilityName:' + ShowNotificationOptions.clickAction.abilityName)
        console.info(TAG + ' ActionResult uri:' + ShowNotificationOptions.clickAction.uri)
        expect(ShowNotificationOptions.contentTitle).assertEqual('Title6')
        expect(ShowNotificationOptions.contentText).assertEqual('This is a notification 006')
        expect(ShowNotificationOptions.clickAction.abilityName).assertEqual('com.example.actsnotificationshow.MainAbility')
        expect(ShowNotificationOptions.clickAction.uri).assertEqual('/')
        done()
      } catch (error) {
        console.error(`show fail: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(801)
        done()
      }
      
    })

    /*
     * @tc.number: Sub_Notification_Ans_Distributed_Enable_5900
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('Sub_Notification_Ans_Distributed_Enable_5900', Level.LEVEL2, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Distributed_Enable_5900 START ')
      let ActionResult = {
        bundleName: 'com.example.actsnotificationshow',
        abilityName: '',
        uri: '/',
      }
      let ShowNotificationOptions = {
        contentTitle: 'Title7',
        contentText: 'This is a notification 007',
        clickAction: ActionResult
      }
      try {
        await notification.show(ShowNotificationOptions)
        console.info(TAG + ' conteneTitle:' + ShowNotificationOptions.contentTitle)
        console.info(TAG + ' contentText:' + ShowNotificationOptions.contentText)
        console.info(TAG + ' ActionResult bundleName:' + ShowNotificationOptions.clickAction.bundleName)
        console.info(TAG + ' ActionResult abilityName:' + ShowNotificationOptions.clickAction.abilityName)
        console.info(TAG + ' ActionResult uri:' + ShowNotificationOptions.clickAction.uri)
        expect(ShowNotificationOptions.contentTitle).assertEqual('Title7')
        expect(ShowNotificationOptions.contentText).assertEqual('This is a notification 007')
        expect(ShowNotificationOptions.clickAction.bundleName).assertEqual('com.example.actsnotificationshow')
        expect(ShowNotificationOptions.clickAction.uri).assertEqual('/')
        done()
      } catch (error) {
        console.error(`show fail: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(801)
        done()
      }
      
    })

    /*
     * @tc.number: Sub_Notification_Ans_Distributed_Enable_6000
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('Sub_Notification_Ans_Distributed_Enable_6000', Level.LEVEL2, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Distributed_Enable_6000 START ')
      let ActionResult = {
        bundleName: 'com.example.actsnotificationshow',
        abilityName: 'com.example.actsnotificationshow.MainAbility',
        uri: '',
      }
      let ShowNotificationOptions = {
        contentTitle: 'Title8',
        contentText: 'This is a notification 008',
        clickAction: ActionResult
      }
      try {
        await notification.show(ShowNotificationOptions)
        console.info(TAG + ' conteneTitle:' + ShowNotificationOptions.contentTitle)
        console.info(TAG + ' contentText:' + ShowNotificationOptions.contentText)
        console.info(TAG + ' ActionResult bundleName:' + ShowNotificationOptions.clickAction.bundleName)
        console.info(TAG + ' ActionResult abilityName:' + ShowNotificationOptions.clickAction.abilityName)
        console.info(TAG + ' ActionResult uri:' + ShowNotificationOptions.clickAction.uri)
        expect(ShowNotificationOptions.contentTitle).assertEqual('Title8')
        expect(ShowNotificationOptions.contentText).assertEqual('This is a notification 008')
        expect(ShowNotificationOptions.clickAction.bundleName).assertEqual('com.example.actsnotificationshow')
        expect(ShowNotificationOptions.clickAction.abilityName).assertEqual('com.example.actsnotificationshow.MainAbility')
        done()
      } catch (error) {
        console.error(`show fail: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(801)
        done()
      }
      
    })

    /*
     * @tc.number: Sub_Notification_Ans_Distributed_Enable_6100
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('Sub_Notification_Ans_Distributed_Enable_6100', Level.LEVEL2, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Distributed_Enable_6100 START ')
      let ActionResult = {
        bundleName: 'com.example.actsnotificationshow',
        abilityName: 'com.example.actsnotificationshow.MainAbility',
        uri: '/',
      }
      let ShowNotificationOptions = {
        contentText: 'This is a notification 009',
        clickAction: ActionResult
      }
      try {
        await notification.show(ShowNotificationOptions)
        console.info(TAG + ' contentText:' + ShowNotificationOptions.contentText)
        console.info(TAG + ' ActionResult bundleName:' + ShowNotificationOptions.clickAction.bundleName)
        console.info(TAG + ' ActionResult abilityName:' + ShowNotificationOptions.clickAction.abilityName)
        console.info(TAG + ' ActionResult uri:' + ShowNotificationOptions.clickAction.uri)
        expect(ShowNotificationOptions.contentText).assertEqual('This is a notification 009')
        expect(ShowNotificationOptions.clickAction.bundleName).assertEqual('com.example.actsnotificationshow')
        expect(ShowNotificationOptions.clickAction.abilityName).assertEqual('com.example.actsnotificationshow.MainAbility')
        expect(ShowNotificationOptions.clickAction.uri).assertEqual('/')
        done()
      } catch (error) {
        console.error(`show fail: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(801)
        done()
      }
      
    })

    /*
     * @tc.number: Sub_Notification_Ans_Distributed_Enable_6200
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('Sub_Notification_Ans_Distributed_Enable_6200', Level.LEVEL2, async function (done) {
      console.info(TAG + 'Sub_Notification_Ans_Distributed_Enable_6200 START ')
      let ActionResult = {
        bundleName: 'com.example.actsnotificationshow',
        abilityName: 'com.example.actsnotificationshow.MainAbility',
        uri: '/',
      }
      let ShowNotificationOptions = {
        contentTitle: 'Title10',
        clickAction: ActionResult
      }
      try {
        await notification.show(ShowNotificationOptions)
        console.info(TAG + ' conteneTitle:' + ShowNotificationOptions.contentTitle)
        console.info(TAG + ' ActionResult bundleName:' + ShowNotificationOptions.clickAction.bundleName)
        console.info(TAG + ' ActionResult abilityName:' + ShowNotificationOptions.clickAction.abilityName)
        console.info(TAG + ' ActionResult uri:' + ShowNotificationOptions.clickAction.uri)
        expect(ShowNotificationOptions.contentTitle).assertEqual('Title10')
        expect(ShowNotificationOptions.clickAction.bundleName).assertEqual('com.example.actsnotificationshow')
        expect(ShowNotificationOptions.clickAction.abilityName).assertEqual('com.example.actsnotificationshow.MainAbility')
        expect(ShowNotificationOptions.clickAction.uri).assertEqual('/')
        done()
      } catch (error) {
        console.error(`show fail: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(801)
        done()
      }
      
    })

    console.info(TAG + "SUB_NOTIFICATION_ANS_SHOW_TEST END");


  })

}
