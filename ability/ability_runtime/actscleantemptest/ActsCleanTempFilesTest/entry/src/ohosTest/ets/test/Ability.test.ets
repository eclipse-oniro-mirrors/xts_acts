/*
* Copyright (c) 2023 Huawei Device Co., Ltd.
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

import commonEvent from '@ohos.commonEventManager';
import delegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, it, expect } from '@ohos/hypium';
import { getContext } from '../common/getContext';
import common from '@ohos.app.ability.common';

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

let abilityDelegator = delegatorRegistry.getAbilityDelegator();
let ACTS_Register: commonEvent.CommonEventSubscribeInfo = {
  events: ['Acts_CleanTempFiles_0101', 'Acts_CleanTempFiles_0102', 'Acts_CleanTempFiles_0103',
    'Acts_CleanTempFiles_0104', 'Acts_CleanTempFiles_0201', 'Acts_CleanTempFiles_0202', 'Acts_CleanTempFiles_0203',
    'Acts_CleanTempFiles_0204', 'Acts_CleanTempFiles_0301', 'Acts_CleanTempFiles_0302', 'Acts_CleanTempFiles_0401',
    'Acts_CleanTempFiles_0402']
};

export default function abilityTest() {
  describe('ActsCleanTempFilesTest', () => {

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AppManager_CleanCacheFiles_0100
     * @tc.name: Support normal exit of application to clean up temp data
     * @tc.desc: Clean up temp data when the application exits normally.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_CleanCacheFiles_0100', 0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      console.info('Acts_CleanTempFiles_0100 start');

      let msg: Record<string, boolean> = {
        'ACTS_RegisterEvent_First': false,
        'ACTS_RegisterEvent_Second': false,
        'ACTS_RegisterEvent_Third': false,
        'ACTS_RegisterEvent_Fourth': false
      }

      commonEvent.createSubscriber(ACTS_Register).then(async (data) => {
        console.log('Acts_CleanTempFiles_0100 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.log('Acts_CleanTempFiles_0100 subscribeCallBack data: ' + JSON.stringify(data));
          if (data.event == 'Acts_CleanTempFiles_0101') {
            console.log('Acts_CleanTempFiles_0101 event call');
            expect(data.parameters!.message).assertEqual('Try to write str.');
            expect(data.parameters!.secondMessage).assertEqual('Try to write application str.');
            msg['ACTS_RegisterEvent_First'] = true;
          } else if (data.event == 'Acts_CleanTempFiles_0102') {
            console.log('Acts_CleanTempFiles_0102 event call');
            expect(data.parameters!.message).assertEqual(0);
            expect(data.parameters!.secondMessage).assertEqual(0);
            expect(data.parameters!.files).assertEqual(0);
            expect(data.parameters!.secFiles).assertEqual(0);
            msg['ACTS_RegisterEvent_Second'] = true;
          } else if (data.event == 'Acts_CleanTempFiles_0103') {
            console.log('Acts_CleanTempFiles_0103 event call');
            expect(data.parameters!.message).assertEqual('Try to write feature str.');
            msg['ACTS_RegisterEvent_Third'] = true;
          } else if (data.event == 'Acts_CleanTempFiles_0104') {
            console.log('Acts_CleanTempFiles_0104 event call');
            expect(data.parameters!.result).assertEqual(0);
            expect(data.parameters!.files).assertEqual(0);
            msg['ACTS_RegisterEvent_Fourth'] = true;
          }
          if (msg['ACTS_RegisterEvent_First'] == true && msg['ACTS_RegisterEvent_Second'] == true &&
            msg['ACTS_RegisterEvent_Third'] == true && msg['ACTS_RegisterEvent_Fourth'] == true) {
            commonEvent.unsubscribe(subscriber, async () => {
              console.log('Acts_CleanTempFiles_0100 unSubscribeCallback');
              await sleep(500);
              done();
            });
          }
        });
        await sleep(200);
        console.info('Acts_CleanTempFiles_0100 startAbility one');
        console.info('context is ' + JSON.stringify(getContext));
        getContext().startAbility(
          {
            bundleName: 'com.acts.cleancachefilesreply',
            abilityName: 'EntryAbility',
            parameters: {
              key: 'Acts_CleanTempFiles_0101'
            }
          }, (err) => {
          console.log('Acts_CleanTempFiles_0101 startAbility err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
        await sleep(4000);
        console.info('Acts_CleanTempFiles_0100 startAbility two');
        getContext().startAbility(
          {
            bundleName: 'com.acts.cleancachefilesreply',
            abilityName: 'EntryAbility',
            parameters: {
              key: 'Acts_CleanTempFiles_0102'
            }
          }, (err) => {
          console.log('Acts_CleanTempFiles_0102 startAbility err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AppManager_CleanCacheFiles_0200
     * @tc.name: Support normal exit of application to clean up temp data
     * @tc.desc: When an application exception exits, the framework will not take the initiative to clean up the temp
     *           directory data because it is too late to deal with it.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_CleanCacheFiles_0200', 0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      console.info('Acts_CleanTempFiles_0200 start');

      let msg: Record<string, boolean> = {
        'ACTS_RegisterEvent_First': false,
        'ACTS_RegisterEvent_Second': false,
        'ACTS_RegisterEvent_Third': false,
        'ACTS_RegisterEvent_Fourth': false
      }

      commonEvent.createSubscriber(ACTS_Register).then(async (data) => {
        console.log('Acts_CleanTempFiles_0200 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.log('Acts_CleanTempFiles_0200 subscribeCallBack data: ' + JSON.stringify(data));
          if (data.event == 'Acts_CleanTempFiles_0201') {
            console.log('Acts_CleanTempFiles_0201 call');
            expect(data.parameters!.message).assertEqual('Try to write str.');
            expect(data.parameters!.secondMessage).assertEqual('Try to write application str.');
            msg['ACTS_RegisterEvent_First'] = true;
          } else if (data.event == 'Acts_CleanTempFiles_0202') {
            console.log('Acts_CleanTempFiles_0202 call');
            expect(data.parameters!.message).assertEqual('Try to write str.');
            expect(data.parameters!.secondMessage).assertEqual('Try to write application str.');
            msg['ACTS_RegisterEvent_Second'] = true;
          } else if (data.event == 'Acts_CleanTempFiles_0203') {
            console.log('Acts_CleanTempFiles_0203 call');
            expect(data.parameters!.message).assertEqual('Try to write feature str.');
            msg['ACTS_RegisterEvent_Third'] = true;
            let stop = 'aa force-stop com.acts.cleancachefilesreply';
            abilityDelegator.executeShellCommand(stop, (err, res) => {
              console.log('Acts_CleanTempFiles_0200 pkill err: ' + JSON.stringify(err) + ' data: ' +
              JSON.stringify(res));
            })
          } else if (data.event == 'Acts_CleanTempFiles_0204') {
            console.log('Acts_CleanTempFiles_0204 call');
            expect(data.parameters!.message).assertEqual('Try to write feature str.');
            msg['ACTS_RegisterEvent_Fourth'] = true;
          }
          if (msg['ACTS_RegisterEvent_First'] == true && msg['ACTS_RegisterEvent_Second'] == true &&
            msg['ACTS_RegisterEvent_Third'] == true && msg['ACTS_RegisterEvent_Fourth'] == true) {
            commonEvent.unsubscribe(subscriber, async () => {
              console.log('Acts_CleanTempFiles_0200 unSubscribeCallback');
              await sleep(500);
              done();
            });
          }
        });
        await sleep(200);
        console.info('Acts_CleanTempFiles_0200 startAbility one');
        console.info('context is ' + JSON.stringify(getContext));
        getContext().startAbility(
          {
            bundleName: 'com.acts.cleancachefilesreply',
            abilityName: 'EntryAbility',
            parameters: {
              key: 'Acts_CleanTempFiles_0201'
            }
          }, (err) => {
          console.log('Acts_CleanTempFiles_0201 startAbility err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
        await sleep(4000);
        console.info('Acts_CleanTempFiles_0200 startAbility two');
        getContext().startAbility(
          {
            bundleName: 'com.acts.cleancachefilesreply',
            abilityName: 'EntryAbility',
            parameters: {
              key: 'Acts_CleanTempFiles_0202'
            }
          }, (err) => {
          console.log('Acts_CleanTempFiles_0202 startAbility err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AppManager_CleanCacheFiles_0300
     * @tc.name: Support normal exit of application to clean up temp data
     * @tc.desc: The temp directory data will not be cleaned actively when the exception scenario exits abnormally.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_CleanCacheFiles_0300', 0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      console.info('Acts_CleanTempFiles_0300 start');

      let msg: Record<string, boolean> = {
        'ACTS_RegisterEvent_First': false, 'ACTS_RegisterEvent_Second': false
      }

      commonEvent.createSubscriber(ACTS_Register).then(async (data) => {
        console.log('Acts_CleanTempFiles_0300 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.log('Acts_CleanTempFiles_0300 subscribeCallBack data: ' + JSON.stringify(data));
          if (data.event == 'Acts_CleanTempFiles_0301') {
            console.log('Acts_CleanTempFiles_0301 event call');
            expect(data.parameters!.message).assertEqual('Try to write Acts_CleanTempFiles_0301 str.');
            msg['ACTS_RegisterEvent_First'] = true;
          } else if (data.event == 'Acts_CleanTempFiles_0302') {
            console.log('Acts_CleanTempFiles_0302 event call');
            expect(data.parameters!.message).assertEqual('Try to write Acts_CleanTempFiles_0301 str.');
            msg['ACTS_RegisterEvent_Second'] = true;
          }
          if (msg['ACTS_RegisterEvent_First'] == true && msg['ACTS_RegisterEvent_Second'] == true) {
            commonEvent.unsubscribe(subscriber, async () => {
              console.log('Acts_CleanTempFiles_0300 unSubscribeCallback');
              await sleep(500);
              done();
            });
          }
        });
        await sleep(200);
        console.info('Acts_CleanTempFiles_0300 startAbility one');
        getContext().startAbility(
          {
            bundleName: 'com.acts.cleancachefilesreply',
            abilityName: 'EntryAbility',
            parameters: {
              key: 'Acts_CleanTempFiles_0301'
            }
          }, (err) => {
          console.log('Acts_CleanTempFiles_0301 startAbility err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
        await sleep(2000);
        console.info('Acts_CleanTempFiles_0300 startAbility two');
        getContext().startAbility(
          {
            bundleName: 'com.acts.cleancachefilesreply',
            abilityName: 'EntryAbility',
            parameters: {
              key: 'Acts_CleanTempFiles_0302'
            }
          }, (err) => {
          console.log('Acts_CleanTempFiles_0302 startAbility err: ' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AppManager_CleanCacheFiles_0400
     * @tc.name: Support normal exit of application to clean up temp data
     * @tc.desc: Use disconnect to disconnect serviceExtension and clean up temp data.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_CleanCacheFiles_0400', 0, async (done: Function) => {
      console.info('Acts_CleanTempFiles_0400 start');
      let subscriber: commonEvent.CommonEventSubscriber;
      let connectionId: number;
      let options: common.ConnectOptions = {
        onConnect: async (element, proxy) => {
          console.info('service onConnect element: ' + JSON.stringify(element) + 'proxy' + JSON.stringify(proxy));
        },
        onDisconnect: async (element1) => {
          console.info('service onDisconnect element1 : ' + JSON.stringify(element1));
        },
        onFailed: async (code) => {
          console.info('service onFailed errCode : ' + JSON.stringify(code));
        }
      }

      let msg: Record<string, boolean> = {
        'ACTS_RegisterEvent_First': false, 'ACTS_RegisterEvent_Second': false
      }

      commonEvent.createSubscriber(ACTS_Register).then(async (data) => {
        console.log('Acts_CleanTempFiles_0400 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.log('Acts_CleanTempFiles_0400 subscribeCallBack data: ' + JSON.stringify(data));
          if (data.event == 'Acts_CleanTempFiles_0401') {
            console.log('Acts_CleanTempFiles_0401 event call');
            expect(data.parameters!.message).assertEqual('Try to write Acts_CleanTempFiles_0400 str.');
            getContext().disconnectServiceExtensionAbility(connectionId).then((data) => {
              console.log('disconnectServiceExtensionAbility data:' + JSON.stringify(data));
            })
            msg['ACTS_RegisterEvent_First'] = true;
          } else if (data.event == 'Acts_CleanTempFiles_0402') {
            console.log('Acts_CleanTempFiles_0402 event call');
            expect(data.parameters!.message).assertEqual(0);
            msg['ACTS_RegisterEvent_Second'] = true;
          }
          if (msg['ACTS_RegisterEvent_First'] == true && msg['ACTS_RegisterEvent_Second'] == true) {
            commonEvent.unsubscribe(subscriber, async () => {
              console.log('Acts_CleanTempFiles_0400 unSubscribeCallback');
              await sleep(500);
              done();
            });
          }
        });
        await sleep(200);
        console.info('Acts_CleanTempFiles_0400 startAbility one');
        connectionId = getContext().connectServiceExtensionAbility(
          {
            bundleName: 'com.acts.cleancachefilesreply',
            abilityName: 'ServiceAbility',
            parameters: {
              key: 'Acts_CleanTempFiles_0401'
            }
          }, options)
        await sleep(2000);
        console.info('Acts_CleanTempFiles_0400 startAbility two');
        getContext().connectServiceExtensionAbility(
          {
            bundleName: 'com.acts.cleancachefilesreply',
            abilityName: 'ServiceAbility',
            parameters: {
              key: 'Acts_CleanTempFiles_0402'
            }
          }, options)
      })
    })
  })
}