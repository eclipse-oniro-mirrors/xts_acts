/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import {  Utils } from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function webHitTestTypeEnumTest01() {
  describe('WebHitTestTypeEnumTest01', () => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testWebHitTestTypeEnumStatic001
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0100
     * @tc.desc   test the value of WebHitTestType.EditText is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebHitTestTypeEnumStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebHitTestTypeEnum001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebHitTestTypeEnum001', 0, 70143, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
        await Utils.msSleep(8000);
        done();
      })

    /**
     * @tc.name   testWebHitTestTypeEnumStatic002
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0200
     * @tc.desc   test the value of WebHitTestType.Email is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebHitTestTypeEnumStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebHitTestTypeEnum002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebHitTestTypeEnum002', 1, 70144, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
        await Utils.msSleep(8000);
        done();
      })

    /**
     * @tc.name   testWebHitTestTypeEnumStatic003
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0300
     * @tc.desc   test the value of WebHitTestType.HttpAnchor is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebHitTestTypeEnumStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebHitTestTypeEnum003', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebHitTestTypeEnum003', 2, 70145, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
        await Utils.msSleep(8000);
        done();
      })

    /**
     * @tc.name   testWebHitTestTypeEnumStatic004
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0400
     * @tc.desc   test the value of WebHitTestType.HttpAnchorImg is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebHitTestTypeEnumStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebHitTestTypeEnum004', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebHitTestTypeEnum004', 3, 70146, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
        await Utils.msSleep(8000);
        done();
      })

    /**
     * @tc.name   testWebHitTestTypeEnumStatic005
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0500
     * @tc.desc   test the value of WebHitTestType.Img is 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebHitTestTypeEnumStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebHitTestTypeEnum005', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebHitTestTypeEnum005', 4, 70147, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
        await Utils.msSleep(8000);
        done();
      })

    /**
     * @tc.name   testWebHitTestTypeEnumStatic006
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0600
     * @tc.desc   test the value of WebHitTestType.Map is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebHitTestTypeEnumStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebHitTestTypeEnum006', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebHitTestTypeEnum006', 5, 70148, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
        await Utils.msSleep(8000);
        done();
      })

    /**
     * @tc.name   testWebHitTestTypeEnumStatic007
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0700
     * @tc.desc   test the value of WebHitTestType.Phone is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebHitTestTypeEnumStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebHitTestTypeEnum007', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebHitTestTypeEnum007', 6, 70149, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
        await Utils.msSleep(8000);
        done();
      })

    /**
     * @tc.name   testWebHitTestTypeEnumStatic008
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0800
     * @tc.desc   test the value of WebHitTestType.Unknown is 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebHitTestTypeEnumStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebHitTestTypeEnum008', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebHitTestTypeEnum008', 7, 70150, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebHitTestTypeEnumTestButton', 10, '');
        await Utils.msSleep(8000);
        done();
      })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number emitonSwitchNextPage
     * @tc.desc   emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("emitonSwitchNextPage", 10)
        await Utils.msSleep(3000);
        let driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebHitTestTypeEnumTestButton'));
        await Utils.msSleep(2000);
        button?.click();
        console.info('click test');
        await Utils.msSleep(6000);
        done()
      })
  })
}