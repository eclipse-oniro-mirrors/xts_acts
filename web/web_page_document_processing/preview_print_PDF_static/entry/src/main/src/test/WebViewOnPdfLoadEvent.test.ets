/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
// @ts-nocheck

export default function ActsAceWebViewOnPdfLoadEvent() {
    describe('ActsAcewebViewWebViewOnPdfLoadEvent', (): void => {
      beforeAll(async (): Promise<void> => {
        console.log('App start')
      });
      beforeEach(async () => {
        await Utils.msSleep(2000);
        console.info('web beforeEach start');
      })
    /**
     * @tc.name   emitwebViewWebViewOnPdfLoadEventStatic001
     * @tc.number SUB_ACE_WEB_WEBVIEWWEBVIEWONPDFLOADEVENT_API_0000
     * @tc.desc   emitwebViewWebViewOnPdfLoadEvent001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitwebViewWebViewOnPdfLoadEventStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitwebViewWebViewOnPdfLoadEvent001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("emitwebViewWebViewOnPdfLoadEvent001", 'resource://rawfile/small.pdf', 300630, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewOnPdfLoadEventKey', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   emitwebViewWebViewOnPdfLoadEventStatic002
     * @tc.number SUB_ACE_WEB_WEBVIEWWEBVIEWONPDFLOADEVENT_API_0002
     * @tc.desc   emitwebViewWebViewOnPdfLoadEvent002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitwebViewWebViewOnPdfLoadEventStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitwebViewWebViewOnPdfLoadEvent002", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("emitwebViewWebViewOnPdfLoadEvent002", 0, 300640, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewOnPdfLoadEventKey', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   emitwebViewWebViewOnPdfScrollEventStatic001
     * @tc.number SUB_ACE_WEB_WEBVIEWWEBVIEWONPDFLOADEVENT_API_0001
     * @tc.desc   emitwebViewWebViewOnPdfLoadEvent002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitwebViewWebViewOnPdfScrollEventStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitwebViewWebViewOnPdfScrollEvent001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("emitwebViewWebViewOnPdfScrollEvent001", 'resource://rawfile/small.pdf', 300641, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewOnPdfLoadEventKey', 10, '');
      await Utils.msSleep(2000);
      done();
    })
  })
}
