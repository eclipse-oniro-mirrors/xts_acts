/*
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import OpenLinkOptions from '@ohos.app.ability.OpenLinkOptions';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';

let domain: number = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext;
let link = 'example://www.example.com';
let linkNotExist = 'demo://www.example.com';
let componentNotExistErrNo = 16000019;
let resultCode = 111;
let trueparameters: Record<String,Object> = {"demo_key": "demo_value"};
let trueParamOptions: OpenLinkOptions = {
  appLinkingOnly: true,
  parameters: trueparameters
};
let falseparameters: Record<String,Object> = {"demo_key": "demo_value"};
let falseParamOptions: OpenLinkOptions = {
  appLinkingOnly: false,
  parameters: falseparameters
};
let parameters: Record<String,Object> = {"demo_key": "demo_value", "demo_num": 111}
let paramOptions: OpenLinkOptions = {
  parameters: parameters
};

export default function openLinkStaticTest() {
  describe('ActsOpenLinkStaticTest', () => {

    beforeAll(() => {
      hilog.info(domain, tag, "beforeAll start");
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll abilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.openlinktest.static")
      await Utils.msSleep(2000);
      context= AppStorage.get<common.UIAbilityContext>("Context") as common.UIAbilityContext;
      hilog.info(domain, tag, "Context: " + context);
      hilog.info(domain, tag, "beforeAll end");
    });
    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_static_0100
     * @tc.name   : AbilityRuntime_OpenLink_static_0100
     * @tc.desc   : The input parameter 'link' is empty，Call the openLink interface through context,and catch parameter invalid exception
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink_static_0100`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_static_0100 begin');
      try {
        context.openLink("").then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0100 open link successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0100 open link err: ` + error.code + error.message);
          expect(error.code).assertEqual(componentNotExistErrNo);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0100 open fail: ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_static_0300
     * @tc.name   : AbilityRuntime_OpenLink_static_0300
     * @tc.desc   : The input parameter 'link' is legal uri string and target app exist,Call the openLink interface through context, open target app successfully
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_static_0300 begin');
      await Utils.msSleep(1000);
      try {
        context.openLink(link).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0300 open link successful`);
          done();
        }).catch((error: BusinessError): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0300 open link err: ` + error.code + error.message);
          expect().assertFail();
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0300 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_static_0400
     * @tc.name   : AbilityRuntime_OpenLink_static_0400
     * @tc.desc   : The input parameter 'link' is legal uri string but target app not exist,Call the openLink interface through context, open target app failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink_static_0400`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_static_0400 begin');
      try {
        context.openLink(linkNotExist).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0400 open link successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0400 open link err: ` + error.code + error.message);
          expect(error.code).assertEqual(componentNotExistErrNo);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0400 open fail: ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink__static_0500
     * @tc.name   : AbilityRuntime_OpenLink__static_0500
     * @tc.desc   : The input parameter 'link' is valid, appLinkingOnly is true,Call the openLink interface through context, open target app failed.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink__static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink__static_0500`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink__static_0500 begin');
      await Utils.msSleep(1000);
      try {
        context.openLink(link, trueParamOptions).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink__static_0500 open link successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink__static_0500 open link err: ` + error.code + error.message);
          expect(error.code).assertEqual(componentNotExistErrNo);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink__static_0500 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_static_0600
     * @tc.name   : AbilityRuntime_OpenLink_static_0600
     * @tc.desc   : The input parameter 'link' is valid, appLinkingOnly is false,Call the openLink interface through context, open target app success.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink_static_0600`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_static_0600 begin');
      await Utils.msSleep(1000);
      try {
        context.openLink(link, falseParamOptions).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0600 open link successful`);
          done();
        }).catch((error: BusinessError): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0600 open link err: ` + error.code + error.message);
          expect().assertFail();
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0600 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_static_0700
     * @tc.name   : AbilityRuntime_OpenLink_static_0700
     * @tc.desc   : The input parameter 'link' is valid, set parameters,Call the openLink interface through context, open target app success.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_static_0700 begin');
      await Utils.msSleep(1000);
      try {
        context.openLink(link, paramOptions).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0700 open link successful`);
          done();
        }).catch((error: BusinessError): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0700 open link err: ` + error.code + error.message);
          expect().assertFail();
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0700 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_static_0800
     * @tc.name   : AbilityRuntime_OpenLink_static_0800
     * @tc.desc   : The input parameter 'link' is valid, set parameters,Call the openLink interface through context, open target app success.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_static_0800 begin');
      await Utils.msSleep(1000);
      try {
        context.openLink(link, paramOptions, (err: BusinessError<void> | null, result: common.AbilityResult | undefined) => {
          if (result !== undefined) {
            hilog.info(domain, tag, `openLink callback result: ${JSON.stringify(result.resultCode)}`);
            hilog.info(domain, tag, `openLink callback result data: ${JSON.stringify(result.want)}`);
            expect(result!.resultCode).assertEqual(resultCode);
          }
          done();
        }).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0800 open link successful`);
          done();
        }).catch((error: BusinessError): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0800 open link err: ` + error.code + error.message);
          expect().assertFail();
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0800 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_static_0900
    * @tc.name   : AbilityRuntime_OpenLink_static_0900
    * @tc.desc   : The input parameter 'link' is valid, appLinkingOnly is true,Call the openLink interface through context, open target app failed.
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
    */
    it('AbilityRuntime_OpenLink_static_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink_static_0900`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_static_0900 begin');
      await Utils.msSleep(1000);
      try {
        context.openLink(link, trueParamOptions, (err: BusinessError<void> | null, result: common.AbilityResult | undefined) => {
          if (result !== undefined) {
            hilog.info(domain, tag, `openLink callback result: ${JSON.stringify(result.resultCode)}`);
            hilog.info(domain, tag, `openLink callback result data: ${JSON.stringify(result.want)}`);
            expect(result!.resultCode).assertEqual(resultCode);
          }
          done();
        }).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0800 open link successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0800 open link err: ` + error.code + error.message);
          expect(error.code).assertEqual(componentNotExistErrNo);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0900 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_static_1000
     * @tc.name   : AbilityRuntime_OpenLink_static_1000
     * @tc.desc   : The input parameter 'link' is valid, appLinkingOnly is false,Call the openLink interface through context, open target app success.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_static_1000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_OpenLink_static_1000`;
      hilog.info(domain, tag, 'AbilityRuntime_OpenLink_static_1000 begin');
      await Utils.msSleep(1000);
      try {
        context.openLink(link, falseParamOptions, (err: BusinessError<void> | null, result: common.AbilityResult | undefined) => {
          if (result !== undefined) {
            hilog.info(domain, tag, `openLink callback result: ${JSON.stringify(result.resultCode)}`);
            hilog.info(domain, tag, `openLink callback result data: ${JSON.stringify(result.want)}`);
            expect(result!.resultCode).assertEqual(resultCode);
          }
          done();
        }).then(() => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0800 open link successful`);
          done();
        }).catch((error: BusinessError): void => {
          hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_0800 open link err: ` + error.code + error.message);
          expect().assertFail();
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `AbilityRuntime_OpenLink_static_1000 open fail : ` + err.code + err.message);
        expect().assertFail();
        done();
      }
    });
  })
}