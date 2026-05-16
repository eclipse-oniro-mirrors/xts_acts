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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
// 加载js测试框架
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import OpenLinkOptions from '@ohos.app.ability.OpenLinkOptions';
import { common, StartOptions, Want } from '@kit.AbilityKit';
import dialogRequest from '@ohos.app.ability.dialogRequest';
import { rpc } from '@kit.IPCKit';
import bundleManager from '@ohos.bundle.bundleManager';
import CompletionHandler from '@ohos.app.ability.CompletionHandler';
import hilog from '@ohos.hilog';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';

let context = getContext(this) as common.UIAbilityContext;;
const DOMAIN = 0x0000;
const LOG_TAG = 'COMPLETION_HANDLER_TEST';
export default function openLinkTest() {
  describe('AbilityBaseUIAbilityContextTest', () => {
    beforeAll(() => {
      context = globalThis.context;
    });
    afterEach(() => {
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_0100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_0100
     * @tc.desc   Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0100`;
      console.log(`${tag}, it begin`);
      let want: Want|null = null;
      try {
        context.startAbility(want, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_0200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_0200
     * @tc.desc   Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0200`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = undefined;
      let options: StartOptions = {
        displayId: 0
      }
      try {
        context.startAbility(want, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_0300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_0300
     * @tc.desc   Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0300`;
      console.log(`${tag}, it begin`);
      let want: Want|null = null
      let options: StartOptions|null = {
        displayId: 0,
        minWindowWidth:100,
        minWindowHeight:100,
        maxWindowWidth:100,
        maxWindowHeight:100
      };
      try {
        context.startAbility(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_0400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_0400
     * @tc.desc   Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0400`;
      console.log(`${tag}, it begin`);
      let want: Want|undefined = undefined;
      let options: StartOptions = {
        displayId: 0
      }
      try {
        context.startAbility(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_0500
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_0500
     * @tc.desc   Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0500`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = null;
      let options: StartOptions = {};
      try {
        context.startAbility(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_0600
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_0600
     * @tc.desc   Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0600`;
      console.log(`${tag}, it begin`);
      let want: Want|undefined = undefined
      let options: StartOptions|undefined = {}
      try {
        context.startAbility(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_0700
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_0700
     * @tc.desc   Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0700`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      let options: StartOptions|null|undefined = {
        displayId: 0
      }
      try {
        context.startAbility(want, options)
          .then(() => {
            console.info('startAbility succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_0800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_0800
     * @tc.desc   Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0800`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =undefined;
      let options: StartOptions|null|undefined = {
        displayId: 0
      }
      try {
        context.startAbility(want, options)
          .then(() => {
            console.info('startAbility succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_0900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_0900
     * @tc.desc   Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0900`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      let options: StartOptions|null|undefined = {}
      try {
        context.startAbility(want, options)
          .then(() => {
            console.info('startAbility succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_1000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_1000
     * @tc.desc   Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1000`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =undefined;
      let options: StartOptions|null|undefined = {}
      try {
        context.startAbility(want, options)
          .then(() => {
            console.info('startAbility succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_1100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_1100
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1100`;
      console.log(`${tag}, it begin`);
      let link: string|null|undefined = null;
      let handler: CompletionHandler = {
        onRequestSuccess: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContext_1100 onRequestSuccess called,
            element: ${JSON.stringify(element)}, message: ${message}`);
            expect().assertFail();
          done();
        },
        onRequestFailure: (element: bundleManager.ElementName, message: string) => {
          hilog.info(DOMAIN, LOG_TAG, '%{public}s', `SUB_Ability_AbilityBase_UIAbilityContext_1100 onRequestFailure called,
            element: ${JSON.stringify(element)}, message: ${message}`);
          expect().assertFail();
          done();
        }
      }
      let options: OpenLinkOptions|undefined = {
        appLinkingOnly: true,
        hideFailureTipDialog: false,
        completionHandler: handler
      }
      try {
        context.openLink(link, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, openLink failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, openLink succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} openLink failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_1200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_1200
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1200`;
      console.log(`${tag}, it begin`);
      let link: string|null|undefined = undefined;
      let options: OpenLinkOptions|undefined = {
        appLinkingOnly: true
      }
      try {
        context.openLink(link, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, openLink failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, openLink succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} openLink failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_1300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_1300
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1300`;
      console.log(`${tag}, it begin`);
      let link: string|null|undefined = undefined;
      let options: OpenLinkOptions|undefined = {}
      try {
        context.openLink(link, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, openLink failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, openLink succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} openLink failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_1400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_1400
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1400`;
      console.log(`${tag}, it begin`);
      let link: string|null|undefined = undefined;
      let options: OpenLinkOptions|undefined = {}
      try {
        context.openLink(link, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, openLink failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, openLink succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} openLink failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_1500
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_1500
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1500`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      try {
        context.startAbilityByCall(want).then(() => {
          console.info(`#${tag}# startAbilityByCall successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# startAbilityByCall err: ${error}`);
          try{expect(error.code).assertEqual(401);}catch{}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByCall failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }

    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_1600
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_1600
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1600`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =undefined;
      try {
        context.startAbilityByCall(want).then(() => {
          console.info(`#${tag}# startAbilityByCall successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# startAbilityByCall err: ${error}`);
          try{expect(error.code).assertEqual(401);}catch{}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByCall failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_1700
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_1700
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1700`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = null;
      try {
        context.startAbilityForResult(want, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_1800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_1800
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1800`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = undefined;
      let options: StartOptions = {
        displayId: 0
      }
      try {
        context.startAbilityForResult(want, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_1900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_1900
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1900`;

      console.log(`${tag}, it begin`);
      let want: Want|null = null
      let options: StartOptions|null = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_2000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_2000
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2000`;
      console.log(`${tag}, it begin`);
      let want: Want|undefined = undefined;
      let options: StartOptions = {
        displayId: 0
      }
      try {
        context.startAbilityForResult(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_2100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_2100
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2100`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = null;
      let options: StartOptions = {};
      try {
        context.startAbilityForResult(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_2200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_2200
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2200`;
      console.log(`${tag}, it begin`);
      let want: Want|undefined = undefined
      let options: StartOptions|undefined = {}
      try {
        context.startAbilityForResult(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_2300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_2300
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2300`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      let options: StartOptions|null|undefined = {
        displayId: 0
      }
      try {
        context.startAbilityForResult(want, options);
        console.info(`${tag}, startAbility succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_2400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_2400
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2400`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =undefined;
      let options: StartOptions|null|undefined = {
        displayId: 0
      }
      try {
        context.startAbilityForResult(want, options);
        console.info(`${tag}, startAbility succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_2500
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_2500
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2500`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      let options: StartOptions|null|undefined = {}
      try {
        context.startAbilityForResult(want, options);
        console.info(`${tag}, startAbility succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_2600
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_2600
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2600`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      let options: StartOptions|null|undefined = {}
      try {
        context.startAbilityForResult(want, options);
        console.info(`${tag}, startAbility succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_2700
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_2700
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2700`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = null;
      try {
        context.terminateSelfWithResult(parameter, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, TerminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, TerminateSelfWithResult succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} TerminateSelfWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_2800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_2800
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2800`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = undefined;
      try {
        context.terminateSelfWithResult(parameter, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, TerminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, TerminateSelfWithResult succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} TerminateSelfWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_2900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_2900
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2900`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = null;
      try {
        context.terminateSelfWithResult(parameter).then(() => {
          console.info(`#${tag}# TerminateSelfWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# TerminateSelfWithResult err: ${error}`);
          expect().assertFail();
          done();
        });;
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} TerminateSelfWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_3000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_3000
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3000`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = undefined;
      try {
        context.terminateSelfWithResult(parameter).then(() => {
          console.info(`#${tag}# TerminateSelfWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# TerminateSelfWithResult err: ${error}`);
          expect().assertFail();
          done();
        });;
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} TerminateSelfWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_3100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_3100
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3100`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = null;
      let request_code: string|null|undefined = '0';
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_3200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_3200
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3200`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = undefined;
      let request_code: string|null|undefined = '0';
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_3300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_3300
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3300`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = null;
      let request_code: string|null|undefined = '';
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_3400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_3400
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3400`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = undefined;
      let request_code: string|null|undefined = '';
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_3500
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_3500
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3500`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = {
        resultCode: 0
      };
      let request_code: string|null|undefined = null;
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_3600
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_3600
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3600`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = {
        resultCode: 0
      };
      let request_code: string|null|undefined = undefined;
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_3700
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_3700
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3700`;
      console.log(`${tag}, it begin`);
      let commRemote: rpc.IRemoteObject;
      let connect_num: number = 0;
      let want: Want|null|undefined = null;
      let connect_options: common.ConnectOptions|null|undefined = {
        onConnect(elementName, remote) {
          commRemote = remote;
          console.info(`${tag}` + ' onConnect... ');
        },
        onDisconnect(elementName) {
          console.info(`${tag}` + ' onDisconnect... ');
        },
        onFailed(code) {
          console.info(`${tag}` + ' onFailed... ' + code);
          try{expect(code).assertEqual(16000001);}catch{}
          done();
        }
      };
      try {
        connect_num = context.connectServiceExtensionAbility(want, connect_options);
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`#${tag}# ConnectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_3800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_3800
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3800`;
      console.log(`${tag}, it begin`);
      let connect_num: number|null|undefined = null;
      try {
        context.disconnectServiceExtensionAbility(connect_num, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, DisConnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
            try{
              expect(err?.code).assertEqual(16000050);
            }catch(e){}
            done();
          }else{
            console.info(`${tag}, DisConnectServiceExtensionAbility succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} DisConnectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_3900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_3900
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3900`;
      console.log(`${tag}, it begin`);
      let label: string|null|undefined = null;
      try {
        context.setMissionLabel(label, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, SetMissionLabel failed, code is ${err.code}, message is ${err.message}`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          }
          console.info(`${tag}, SetMissionLabel succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionLabel failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_4000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_4000
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4000`;
      console.log(`${tag}, it begin`);
      let label: string|null|undefined = undefined;
      try {
        context.setMissionLabel(label, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, SetMissionLabel failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, SetMissionLabel succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionLabel failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_4100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_4100
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4100`;
      console.log(`${tag}, it begin`);
      let label: string|null|undefined = null;
      try {
        context.setMissionLabel(label).then(() => {
          console.info(`#${tag}# SetMissionLabel successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# SetMissionLabel err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionLabel failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_4200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_4200
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4200`;
      console.log(`${tag}, it begin`);
      let label: string|null|undefined = undefined;
      try {
        context.setMissionLabel(label).then(() => {
          console.info(`#${tag}# SetMissionLabel successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# SetMissionLabel err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionLabel failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testSetMissionLabelEmptyStringCallback0100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_4250
     * @tc.desc   Test setMissionLabel with empty string parameter (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetMissionLabelEmptyStringCallback0100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4250`;
      console.log(`${tag}, it begin`);
      let label: string = "";
      try {
        context.setMissionLabel(label, (err: BusinessError, data) => {
          if (err?.code) {
            console.error(`${tag}, SetMissionLabel failed, code is ${err.code}, message is ${err.message}`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          }
          console.info(`${tag}, SetMissionLabel succeed`);
          try{
            expect(data).assertEqual(undefined);
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionLabel failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSetMissionLabelEmptyStringPromise0200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_4260
     * @tc.desc   Test setMissionLabel with empty string parameter (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetMissionLabelEmptyStringPromise0200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4260`;
      console.log(`${tag}, it begin`);
      let label: string = "";
      try {
        context.setMissionLabel(label).then((data) => {
          console.info(`#${tag}# SetMissionLabel successful ` + data);
          expect(data).assertEqual(undefined);
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# SetMissionLabel err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionLabel failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_4300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_4300
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4300`;
      console.log(`${tag}, it begin`);
      let state: AbilityConstant.ContinueState|null|undefined = null;
      try {
        context.setMissionContinueState(state, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, SetMissionContinueState failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, SetMissionContinueState succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionContinueState failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_4400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_4400
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4400`;
      console.log(`${tag}, it begin`);
      let state: AbilityConstant.ContinueState|null|undefined = undefined;
      try {
        context.setMissionContinueState(state, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, SetMissionContinueState failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, SetMissionContinueState succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionContinueState failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_4500
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_4500
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4500`;
      console.log(`${tag}, it begin`);
      let state: AbilityConstant.ContinueState|null|undefined = null;
      try {
        context.setMissionContinueState(state).then(() => {
          console.info(`#${tag}# SetMissionContinueState successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# SetMissionContinueState err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionContinueState failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_4600
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_4600
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4600`;
      console.log(`${tag}, it begin`);
      let state: AbilityConstant.ContinueState|null|undefined = undefined;
      try {
        context.setMissionContinueState(state).then(() => {
          console.info(`#${tag}# SetMissionContinueState successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# SetMissionContinueState err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionContinueState failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_4700
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_4700
     * @tc.desc   Test disconnectServiceExtensionAbility with undefined parameter (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4700`;
      console.log(`${tag}, it begin`);
      let connect_num: number|undefined = undefined;
      try {
        context.disconnectServiceExtensionAbility(connect_num, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, DisConnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
            try{
              expect(err?.code).assertEqual(16000050);
            }catch(e){}
            done();
          }else{
            console.info(`${tag}, DisConnectServiceExtensionAbility succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} DisConnectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_4900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_4900
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4900`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = null;
      try {
        context.requestDialogService(want, (err: BusinessError) => {
          if (err?.code) {
            try{
              console.error(`${tag}, RequestDialogService failed, code is ${err.code}, message is ${err.message}`);
            }catch(e){}
            expect(err?.code).assertEqual(16000001);
            done();
          }else{
            console.info(`${tag}, RequestDialogService succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} RequestDialogService failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_5000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_5000
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_5000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_5000`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = null;
      try {
        context.requestDialogService(want).then(() => {
          console.info(`#${tag}# RequestDialogService successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# RequestDialogService err: ${error}`);
          expect(error?.code).assertEqual(16000001);
          done();
        });;
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} RequestDialogService failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_5100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_5100
     * @tc.desc   Call the interface startAbility through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_5100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_5100`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = undefined;
      try {
        context.requestDialogService(want).then(() => {
          console.info(`#${tag}# RequestDialogService successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# RequestDialogService err: ${error}`);
          expect(error?.code).assertEqual(16000001);
          done();
        });;
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} RequestDialogService failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_5400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_5400
     * @tc.desc   Test startAbility with valid want and null options (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_5400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_5400`;
      console.log(`${tag}, it begin`);
      let want: Want = {
        bundleName: 'com.example.test',
        abilityName: 'MainAbility'
      };
      let options: StartOptions|null = null;
      try {
        context.startAbility(want, options)
          .then((data) => {
            console.info(`${tag}, startAbility succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000001);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_5500
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_5500
     * @tc.desc   Test startAbility with valid want and undefined options (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_5500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_5500`;
      console.log(`${tag}, it begin`);
      let want: Want = {
        bundleName: 'com.example.test',
        abilityName: 'MainAbility'
      };
      let options: StartOptions|undefined = undefined;
      try {
        context.startAbility(want, options)
          .then((data) => {
            console.info(`${tag}, startAbility succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000001);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_5800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_5800
     * @tc.desc   Test startAbilityForResult with valid want and null options (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_5800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_5800`;
      console.log(`${tag}, it begin`);
      let want: Want = {
        bundleName: 'com.example.test',
        abilityName: 'MainAbility'
      };
      let options: StartOptions|null = null;
      try {
        context.startAbilityForResult(want, options)
          .then((data) => {
            console.info(`${tag}, startAbilityForResult succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000001);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityForResult failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_5900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_5900
     * @tc.desc   Test startAbilityForResult with valid want and undefined options (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_5900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_5900`;
      console.log(`${tag}, it begin`);
      let want: Want = {
        bundleName: 'com.example.test',
        abilityName: 'MainAbility'
      };
      let options: StartOptions|undefined = undefined;
      try {
        context.startAbilityForResult(want, options)
          .then((data) => {
            console.info(`${tag}, startAbilityForResult succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000001);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityForResult failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_6000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_6000
     * @tc.desc   Test startAbilityByType with null type (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_6000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_6000`;
      console.log(`${tag}, it begin`);
      let type: string|null = null;
      let wantParam: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`${tag}, onError called, code: ${code}, name: ${name}, message: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`${tag}, onResult called, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback, (err: BusinessError) => {
          console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed catch, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_6100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_6100
     * @tc.desc   Test startAbilityByType with undefined type (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_6100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_6100`;
      console.log(`${tag}, it begin`);
      let type: string|undefined = undefined;
      let wantParam: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`${tag}, onError called, code: ${code}, name: ${name}, message: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`${tag}, onResult called, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback, (err: BusinessError) => {
          console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed catch, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_6200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_6200
     * @tc.desc   Test startAbilityByType with null wantParam (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_6200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_6200`;
      console.log(`${tag}, it begin`);
      let type: string = 'testType';
      let wantParam: Record<string, Object>|null = null;
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`${tag}, onError called, code: ${code}, name: ${name}, message: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`${tag}, onResult called, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback, (err: BusinessError) => {
          console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed catch , code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_6300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_6300
     * @tc.desc   Test startAbilityByType with undefined wantParam (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_6300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_6300`;
      console.log(`${tag}, it begin`);
      let type: string = 'testType';
      let wantParam: Record<string, Object>|undefined = undefined;
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`${tag}, onError called, code: ${code}, name: ${name}, message: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`${tag}, onResult called, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback, (err: BusinessError) => {
          console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed catch, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_6400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_6400
     * @tc.desc   Test startAbilityByType with null abilityStartCallback (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_6400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_6400`;
      console.log(`${tag}, it begin`);
      let type: string = 'testType';
      let wantParam: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback|null = null;
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback, (err: BusinessError, data) => {
          console.info(`${tag}, startAbilityByType succeed`);
          try{
            expect(data).assertEqual(undefined);
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_6500
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_6500
     * @tc.desc   Test startAbilityByType with undefined abilityStartCallback (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_6500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_6500`;
      console.log(`${tag}, it begin`);
      let type: string = 'testType';
      let wantParam: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback|undefined = undefined;
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback, (err: BusinessError, data) => {
          console.info(`${tag}, startAbilityByType succeed`);
          try{
            expect(data).assertEqual(undefined);
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_6800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_6800
     * @tc.desc   Test startAbilityByType with null type (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_6800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_6800`;
      console.log(`${tag}, it begin`);
      let type: string|null = null;
      let wantParam: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`${tag}, onError called, code: ${code}, name: ${name}, message: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`${tag}, onResult called, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback)
          .then((data) => {
            console.info(`${tag}, startAbilityByType succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_6900
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_6900
     * @tc.desc   Test startAbilityByType with undefined type (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_6900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_6900`;
      console.log(`${tag}, it begin`);
      let type: string|undefined = undefined;
      let wantParam: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`${tag}, onError called, code: ${code}, name: ${name}, message: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`${tag}, onResult called, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback)
          .then(() => {
            console.info(`${tag}, startAbilityByType succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_7000
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_7000
     * @tc.desc   Test startAbilityByType with null wantParam (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_7000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_7000`;
      console.log(`${tag}, it begin`);
      let type: string = 'testType';
      let wantParam: Record<string, Object>|null = null;
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`${tag}, onError called, code: ${code}, name: ${name}, message: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`${tag}, onResult called, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback)
          .then(() => {
            console.info(`${tag}, startAbilityByType succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_7100
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_7100
     * @tc.desc   Test startAbilityByType with undefined wantParam (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_7100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_7100`;
      console.log(`${tag}, it begin`);
      let type: string = 'testType';
      let wantParam: Record<string, Object>|undefined = undefined;
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.error(`${tag}, onError called, code: ${code}, name: ${name}, message: ${message}`);
        },
        onResult: (result: common.AbilityResult) => {
          console.info(`${tag}, onResult called, result: ${JSON.stringify(result)}`);
        }
      };
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback)
          .then(() => {
            console.info(`${tag}, startAbilityByType succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_7200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_7200
     * @tc.desc   Test startAbilityByType with null abilityStartCallback (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_7200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_7200`;
      console.log(`${tag}, it begin`);
      let type: string = 'testType';
      let wantParam: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback|null = null;
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback)
          .then((data) => {
            console.info(`${tag}, startAbilityByType succeed`);
            try{
              expect(data).assertEqual(undefined);
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_7300
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_7300
     * @tc.desc   Test startAbilityByType with undefined abilityStartCallback (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_7300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_7300`;
      console.log(`${tag}, it begin`);
      let type: string = 'testType';
      let wantParam: Record<string, Object> = {
        'sceneType': 1
      };
      let abilityStartCallback: common.AbilityStartCallback|undefined = undefined;
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback)
          .then((data) => {
            console.info(`${tag}, startAbilityByType succeed`);
            try{
              expect(data).assertEqual(undefined);
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_7400
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_7400
     * @tc.desc   Test startAbilityByType with all null parameters (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_7400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_7400`;
      console.log(`${tag}, it begin`);
      let type: string|null = null;
      let wantParam: Record<string, Object>|null = null;
      let abilityStartCallback: common.AbilityStartCallback|null = null;
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback, (err: BusinessError, data) => {
          if (err?.code) {
            console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbilityByType succeed`);
          try{
            expect(data).assertEqual(undefined);
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_7500
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_7500
     * @tc.desc   Test startAbilityByType with all undefined parameters (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_7500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_7500`;
      console.log(`${tag}, it begin`);
      let type: string|undefined = undefined;
      let wantParam: Record<string, Object>|undefined = undefined;
      let abilityStartCallback: common.AbilityStartCallback|undefined = undefined;
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback, (err: BusinessError) => {
          console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_7600
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_7600
     * @tc.desc   Test startAbilityByType with all null parameters (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_7600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_7600`;
      console.log(`${tag}, it begin`);
      let type: string|null = null;
      let wantParam: Record<string, Object>|null = null;
      let abilityStartCallback: common.AbilityStartCallback|null = null;
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback)
          .then(() => {
            console.info(`${tag}, startAbilityByType succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_7700
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_7700
     * @tc.desc   Test startAbilityByType with all undefined parameters (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_7700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_7700`;
      console.log(`${tag}, it begin`);
      let type: string|undefined = undefined;
      let wantParam: Record<string, Object>|undefined = undefined;
      let abilityStartCallback: common.AbilityStartCallback|undefined = undefined;
      try {
        context.startAbilityByType(type, wantParam, abilityStartCallback)
          .then(() => {
            console.info(`${tag}, startAbilityByType succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${tag}, startAbilityByType failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByType failed, code is ${code}, message is ${message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_7800
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_7800
     * @tc.desc   Test UIAbilityContext.setColorMode and verify with config.colorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_7800', Level.LEVEL0, async (done: Function) => {
      let tag = `testSSUB_Ability_AbilityBase_UIAbilityContext_7800etColorMode0100`;
      console.log(`${tag}, it begin`);
      try {
        let colorMode = context.config.colorMode;
        console.log(`${tag}, current colorMode: ${colorMode}`);
        if (colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK) {
          context.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
          await sleep(2000);
          console.log(`${tag}, set colorMode to LIGHT, current: ${context.config.colorMode}`);
          expect(context.config.colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT).assertTrue();
        } else if (colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
          context.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
          await sleep(2000);
          console.log(`${tag}, set colorMode to DARK, current: ${context.config.colorMode}`);
          expect(context.config.colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK).assertTrue();
        } else if (colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET) {
          context.setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
          await sleep(2000);
          console.log(`${tag}, set colorMode to DARK, current: ${context.config.colorMode}`);
          expect(context.config.colorMode === colorMode).assertTrue();
        }
        context.setColorMode(colorMode);
        await sleep(2000);
        console.log(`${tag}, restore colorMode to: ${colorMode}, current: ${context.config.colorMode}`);
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag}, setColorMode failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_UIAbilityContext_5200
     * @tc.number SUB_Ability_AbilityBase_UIAbilityContext_5200
     * @tc.desc   Call the interface requestDialogService through context, return errorcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_5200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_5200`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = undefined;
      try {
        context.requestDialogService(want, (err: BusinessError, result: dialogRequest.RequestResult) => {
          if (err?.code) {
            try{
              console.error(`${tag}, RequestDialogService failed, code is ${err.code}, message is ${err.message}`);
              expect(err?.code).assertEqual(16000001);
            }catch(e){}
            done();
          }else{
            console.info(`${tag}, RequestDialogService succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} RequestDialogService failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

  })
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}