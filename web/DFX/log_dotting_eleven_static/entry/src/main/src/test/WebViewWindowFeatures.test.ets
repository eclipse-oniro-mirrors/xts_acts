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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
const driver = Driver.create();

let testAbilityContext: common.UIAbilityContext;

export default function WebViewWindowFeaturesTest() {

    describe('WebViewWindowFeaturesTestSuite', (): void => {

      beforeAll(async (): Promise<void> => {
        console.log('App start')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', 'Succeed!')
      });

      beforeEach(async () => {
        await Utils.msSleep(2000);
        console.info('web beforeEach start');
      })

    /**
     * @tc.name       testWebViewWindowFeaturesStatic001
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0100
     * @tc.desc       onWindowNewExt WindowFeatures	height
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewWindowFeaturesStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewWindowFeatures001', 10)
      let driver = Driver.create()
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      Utils.registerEvent('testWebViewWindowFeaturesStatic001', 600, 20260123, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewWindowFeaturesButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name       testWebViewWindowFeaturesStatic002
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0200
     * @tc.desc       onWindowNewExt WindowFeatures	width
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewWindowFeaturesStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewWindowFeatures002', 10)
      let driver = Driver.create()
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewWindowFeaturesStatic002', 500, 20260124, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewWindowFeaturesButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name       testWebViewWindowFeaturesStatic003
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0300
     * @tc.desc       onWindowNewExt WindowFeatures	x
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewWindowFeaturesStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewWindowFeatures003', 10)
      let driver = Driver.create();
      await Utils.msSleep(2000);
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewWindowFeaturesStatic003', 10, 20260125, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewWindowFeaturesButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name       testWebViewWindowFeaturesStatic004
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0400
     * @tc.desc       onWindowNewExt WindowFeatures	y
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewWindowFeaturesStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewWindowFeatures004', 10)
      let driver = Driver.create();
      await Utils.msSleep(2000);
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewWindowFeaturesStatic004', 20, 20260126, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewWindowFeaturesButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name       testWebViewWindowFeaturesStatic005
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0500
     * @tc.desc       onWindowNewExt isAlert
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewWindowFeaturesStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewWindowFeatures005', 10)
      let driver = Driver.create();
      await Utils.msSleep(2000);
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewWindowFeaturesStatic005', true, 20260127, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewWindowFeaturesButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name       testWebViewWindowFeaturesStatic006
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0600
     * @tc.desc       onWindowNewExt isUserTrigger
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewWindowFeaturesStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewWindowFeatures006', 10)
      let driver = Driver.create()
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewWindowFeaturesStatic006', true, 20260128, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewWindowFeaturesButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name       testWebViewWindowFeaturesStatic007
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0700
     * @tc.desc       onWindowNewExt targetUrl
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewWindowFeaturesStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewWindowFeatures007', 10)
      let driver = Driver.create()
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewWindowFeaturesStatic007', "https://www.baidu.com/", 20260129, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewWindowFeaturesButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name       testWebViewWindowFeaturesStatic008
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0800
     * @tc.desc       onWindowNewExt navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      LEVEL0
     */
    it('testWebViewWindowFeaturesStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitWebViewWindowFeatures008', 10)
      let driver = Driver.create()
      let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
      if(buttonOne){
        buttonOne.click()
      }
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewWindowFeaturesStatic008', 0, 20260130, done);
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebViewWindowFeaturesButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(1000);
      button?.click();
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name        SwitchNextPageStatic
     * @tc.number      testWebViewWindowFeatures009
     * @tc.desc        onWindowNewExt
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(1000);
        let button = await driver.findComponent(ON.id('WebViewWindowFeaturesButton'));
        await Utils.msSleep(1000);
        button?.click();
        await Utils.msSleep(4000)
        done()
      })
  })
}
