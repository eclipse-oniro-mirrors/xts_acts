/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
    import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
    import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
    import Subscriber from '@ohos.commonEvent'
    import hilog from '@ohos.hilog';

    export default function StartAbilityForResultTest() {
      describe('StartAbilityForResultTest', function () {

      /**
       * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2400
       * @tc.name      : The input parameter 'want' is empty
       * @tc.desc      : Call the startAbility interface through context, and validate the want input parameter as {}
       * @tc.level     : Level 3
       * @tc.size      : MediumTest
       * @tc.type      : Function
       */
      it('AbilityRuntime_StartAndTerminate_StartAbility_2400', 3, async function (done) {
        const TAG='StartAbility';
        const TEST_SUITE_NAME : string='StartAbilityTest';
        const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2400';

        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

        try {
          await globalThis.abilityDelegator.startAbility({}).then(() => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
            expect().assertFail();
            done();
          }).catch((error) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${error}`);
            expect(error.code == undefined).assertFalse();
            expect(error.code).assertEqual(2097152);
            done();
          })
        } catch (err) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
          done();
        }
      });


      /**
       * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2600
       * @tc.name      : The input parameter 'want' is undefined
       * @tc.desc      : Call the startAbility interface through context, with want as undefined
       * @tc.level     : Level 3
       * @tc.size      : MediumTest
       * @tc.type      : Function
       */
      it('AbilityRuntime_StartAndTerminate_StartAbility_2600', 3, async function (done) {
        const TAG='StartAbility';
        const TEST_SUITE_NAME : string='StartAbilityTest';
        const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2600';

        hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

        try {
          await globalThis.abilityDelegator.startAbility(undefined).then(() => {      
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`); 
            expect().assertFail(); 
            done();
          }).catch((error) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${error}`); 
            expect(error.code == undefined).assertFalse(); 
            expect(error.code).assertEqual(2097152); 
            done();
          })
        } catch (err) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`); 
          done();
        }
      });

        
      /**
       * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2700
       * @tc.name      : BundleName and activityName are both correct values
       * @tc.desc      : By calling the startAbility interface through context, 
       *                 both the wantAbilityName and bundleName parameters are correct values
       * @tc.level     : Level 3
       * @tc.size      : MediumTest
       * @tc.type      : Function
       */
        it('AbilityRuntime_StartAndTerminate_StartAbility_2700', 3, async function (done) {
          const TAG='StartAbility';
          const TEST_SUITE_NAME : string='StartAbilityTest';
          const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2700';

          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

          var lifeMethodCalledCount=0;

          //onCreate回调
          function onCreateCallback() {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
            lifeMethodCalledCount++;
            expect(lifeMethodCalledCount).assertEqual(1);
          }

          //onWindowStageCreate回调
          function onWindowStageCreateCallback() {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
            lifeMethodCalledCount++;
            expect(lifeMethodCalledCount).assertEqual(2);
          }

          //onForeground的回调
          function onForegroundCallback() {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
            lifeMethodCalledCount++;
            expect(lifeMethodCalledCount).assertEqual(3);
            done();
            lifeMethodCalledCount=0;
          }
          
          var delegator= AbilityDelegatorRegistry.getAbilityDelegator();
          
          const abilityName='SecondAbility';

          //设置监听器,监听新ability的生命周期函数
            let monitor={
              abilityName:abilityName,
              onAbilityCreate:onCreateCallback,
              onWindowStageCreate:onWindowStageCreateCallback,
              onAbilityForeground:onForegroundCallback,
            };
            delegator.addAbilityMonitor(monitor,(async (err,result)=>{
              let want = {
                bundleName:'com.example.mytest1',
                abilityName:abilityName,
              }
              try {
                await delegator.startAbility(want).then(async()=>{
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
                }).catch((err)=>{
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
                })
              }catch (error){
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`); 
              }
            }))
        });


        /**
         * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2800
         * @tc.name      : BundleName is the correct value, activityName is the incorrect value
         * @tc.desc      : Call the startAbility interface through context, where the wantBundleName 
         *                 parameter is the correct value and the activityName parameter is the incorrect value
         * @tc.level     : Level 3
         * @tc.size      : MediumTest
         * @tc.type      : Function
         */
          it('AbilityRuntime_StartAndTerminate_StartAbility_2800', 3, async function (done) {
            const TAG='StartAbility';
            const TEST_SUITE_NAME : string='StartAbilityTest';
            const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2800';

            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

            let want = {
              // 'abilityName': 'SecondAbility',
              'abilityName': 'X',
              'bundleName': 'com.example.mytest1',
            };
            try {
              var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
              await delegator.startAbility(want).then(async () => {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
              }).catch((err) => {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
                expect(err.code).assertEqual(2097152);
                done();
              })
            }
            catch (err) {
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
              done();
            }
          });


          /**
           * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2900
           * @tc.name      : AbilityName is the correct value, bundleName is the incorrect value
           * @tc.desc      : Call the startAbility interface through context, where the wantAbilityName
           *                 parameter is the correct value and the bundleName parameter is the incorrect value
           * @tc.level     : Level 3
           * @tc.size      : MediumTest
           * @tc.type      : Function
           */
          it('AbilityRuntime_StartAndTerminate_StartAbility_2900', 3, async function (done) {
            const TAG='StartAbility';
            const TEST_SUITE_NAME : string='StartAbilityTest';
            const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2900';

            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

            let want = {
              'abilityName': 'SecondAbility',
              // 'bundleName': 'com.example.mytest1',
              'bundleName': 'xxx',
            };
            try {
              var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
              await delegator.startAbility(want).then(async () => {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
              }).catch((err) => {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
                expect(err.code).assertEqual(2097152);
                done();
              })
            }
            catch (err) {
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${err}`);
              done();
            }
          }); 

            
          /**
           * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3000
           * @tc.name      : Call the startAbility interface through context, where the wantAbilityName parameter is the correct value,
           *                 the bundleName parameter is the incorrect value, configure bundleName, activityName, 
           *                 and deviceId, and the deviceid parameter is undefined
           * @tc.desc      : Call the startAbility interface through context, where the wantAbilityName 
           *                 and bundleName are the correct values, and deviceid is undefined
           * @tc.level     : Level 3
           * @tc.size      : MediumTest
           * @tc.type      : Function
           */
          it('AbilityRuntime_StartAndTerminate_StartAbility_3000', 3, async function (done) {

            const TAG='StartAbility';
            const TEST_SUITE_NAME : string='StartAbilityTest';
            const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3000';

            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

            var lifeMethodCalledCount = 0;

            //onCreate回调
            function onCreateCallback() {
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
              lifeMethodCalledCount++;
              expect(lifeMethodCalledCount).assertEqual(1);
            }
            //onWindowStageCreate回调
            function onWindowStageCreateCallback() {
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
              lifeMethodCalledCount++;
              expect(lifeMethodCalledCount).assertEqual(2);
            }
            //onForeground回调
            function onForegroundCallback() {
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
              lifeMethodCalledCount++;
              expect(lifeMethodCalledCount).assertEqual(3);
              done();
              lifeMethodCalledCount=0;
            }

            var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
            const abilityName = 'SecondAbility';

            //设置监听器,监听新ability的生命周期函数
            let monitor = {
              abilityName: abilityName,
              onAbilityCreate: onCreateCallback,
              onWindowStageCreate: onWindowStageCreateCallback,
              onAbilityForeground: onForegroundCallback
            };
            delegator.addAbilityMonitor(monitor, (async (err, result) => {
              let want = {
                bundleName: 'com.example.mytest1',
                abilityName: abilityName,
                deviceId: undefined
              }
              try {
                await delegator.startAbility(want).then(async () => {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
                }).catch((err) => {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
                })
              }catch (error){
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
              }
            }))
          }); 
          

            /**
             * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3100
             * @tc.name      : Configure bundleName, activityName, and uri, corresponding to the ability configured with uri
             * @tc.desc      : Call the startAbility interface through context, where the wantAbilityName 
             *                 and bundleName are the correct values,and the uri has a corresponding Ability
             * @tc.level     : Level 3
             * @tc.size      : MediumTest
             * @tc.type      : Function
             */
            it('AbilityRuntime_StartAndTerminate_StartAbility_3100', 3, async function (done) {
              const TAG='StartAbility';
              const TEST_SUITE_NAME : string='StartAbilityTest';
              const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3100';

              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

              var lifeMethodCalledCount = 0;

              //onCreate回调
              function onCreateCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(1);
              }
              //onWindowStageCreate回调
              function onWindowStageCreateCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(2);
              }
              //onForeground回调
              function onForegroundCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(3);
                done();
                lifeMethodCalledCount=0;
              }

              var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
              const abilityName = 'SecondAbility';

              //设置监听器,监听新ability的生命周期函数
              let monitor = {
                abilityName: abilityName,
                onAbilityCreate: onCreateCallback,
                onWindowStageCreate: onWindowStageCreateCallback,
                onAbilityForeground: onForegroundCallback
              };
              delegator.addAbilityMonitor(monitor, (async (err, result) => {
                let want = {
                  //bundleName: 'com.example.mytest1',
                  //abilityName: abilityName,
                  uri: "https://www.test.com:8080/query/student"
                }
                try {
                  await delegator.startAbility(want).then(async () => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
                  }).catch((err) => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
                  })
                } catch (error) {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                }
              }))
            });


            /**
             * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3200
             * @tc.name      : Configure bundleName, activityName, and flags with a correct flag value
             * @tc.desc      : Call the startAbility interface through context, where the wantAbilityName 
             *                 and bundleName are the correct values,and the flag is the correct value
             * @tc.level     : Level 3
             * @tc.size      : MediumTest
             * @tc.type      : Function
             */
            it('AbilityRuntime_StartAndTerminate_StartAbility_3200', 3, async function (done) {

              const TAG='StartAbility';
              const TEST_SUITE_NAME : string='StartAbilityTest';
              const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3200';

              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

              var lifeMethodCalledCount = 0;

              //onCreate回调
              function onCreateCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(1);
              }
              //onWindowStageCreate回调
              function onWindowStageCreateCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(2);
              }
              //onForeground回调
              function onForegroundCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(3);
                done();
                lifeMethodCalledCount=0;
              }

              var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
              const abilityName = 'SecondAbility';

              //设置监听器,监听新ability的生命周期函数
              let monitor = {
                abilityName: abilityName,
                onAbilityCreate: onCreateCallback,
                onWindowStageCreate: onWindowStageCreateCallback,
                onAbilityForeground: onForegroundCallback
              };
              delegator.addAbilityMonitor(monitor, (async (err, result) => {
                let want = {
                  bundleName: 'com.example.mytest1',
                  abilityName: abilityName,
                 // flags: 0x00000001
                  flags: 0x00000002
                }
                try {
                  await delegator.startAbility(want).then(async () => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
                  }).catch((err) => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
                  })
                }catch (error){
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                }
              }))
            });


            /**
             * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3300
             * @tc.name      : Configure bundleName, activityName, and flags to match the two correct flag values
             * @tc.desc      : Call the startAbility interface through context, where the wantAbilityName 
             *                 and bundleName are the correct values,and the flag is the sum of the two correct flag values
             * @tc.level     : Level 3
             * @tc.size      : MediumTest
             * @tc.type      : Function
             */
            it('AbilityRuntime_StartAndTerminate_StartAbility_3300', 3, async function (done) {

              const TAG='StartAbility';
              const TEST_SUITE_NAME : string='StartAbilityTest';
              const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3300';

              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

              var lifeMethodCalledCount = 0;

              //onCreate回调
              function onCreateCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(1);
              }
              //onWindowStageCreate回调
              function onWindowStageCreateCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(2);
              }
              //onForeground回调
              function onForegroundCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(3);
                done();
                lifeMethodCalledCount=0;
              }

              var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
              const abilityName = 'SecondAbility';
              const flag1=0x00000001;
              const flag2=0x00000002;
              //flag1或flag2
              const res=flag1 | flag2;

              //设置监听器,监听新ability的生命周期函数
              let monitor = {
                abilityName: abilityName,
                onAbilityCreate: onCreateCallback,
                onWindowStageCreate: onWindowStageCreateCallback,
                onAbilityForeground: onForegroundCallback
              };
              delegator.addAbilityMonitor(monitor, (async (err, result) => {
                let want = {
                  bundleName: 'com.example.mytest1',
                  abilityName: abilityName,
                  flags: res
                }
                try{
                  await delegator.startAbility(want).then(async () => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
                  }).catch((err) => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
                  })
                }catch (error){
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                }
              }))
            });


            /**
             * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3400
             * @tc.name      : Configure bundleName, activityName, and flags, with a floating-point flag value
             * @tc.desc      : Call the startAbility interface through context, where the wantAbilityName
             *                 and bundleName are the correct values,and the flag is a floating-point flag value
             * @tc.level     : Level 3
             * @tc.size      : MediumTest
             * @tc.type      : Function
             */
              it('AbilityRuntime_StartAndTerminate_StartAbility_3400', 3, async function (done) {

                const TAG='StartAbility';
                const TEST_SUITE_NAME : string='StartAbilityTest';
                const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3400';

                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

                var lifeMethodCalledCount = 0;

                //onCreate回调
                function onCreateCallback() {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
                  lifeMethodCalledCount++;
                  expect(lifeMethodCalledCount).assertEqual(1);
                }
                //onWindowStageCreate回调
                function onWindowStageCreateCallback() {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
                  lifeMethodCalledCount++;
                  expect(lifeMethodCalledCount).assertEqual(2);
                }
                //onForeground回调
                function onForegroundCallback() {
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
                  lifeMethodCalledCount++;
                  expect(lifeMethodCalledCount).assertEqual(3);
                  done();
                  lifeMethodCalledCount=0;
                }

                var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
                const abilityName = 'SecondAbility';

                //设置监听器,监听新ability的生命周期函数
                let monitor = {
                  abilityName: abilityName,
                  onAbilityCreate: onCreateCallback,
                  onWindowStageCreate: onWindowStageCreateCallback,
                  onAbilityForeground: onForegroundCallback
                };
                delegator.addAbilityMonitor(monitor, (async (err, result) => {
                  let want = {
                    bundleName: 'com.example.mytest1',
                    abilityName: abilityName,
                    flag: 1.22
                  }
                  try {
                    await delegator.startAbility(want).then(async () => {
                      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
                    }).catch((err) => {
                      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
                    })
                  }catch (error){
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                  }
                }))
              });


            /**
             * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3500
             * @tc.name      : Configure bundleName, activityName, and flags, where flags are numeric strings
             * @tc.desc      : Call the startAbility interface through context, where the wantAbilityName 
             *                 and bundleName are the correct values,the flag is a string, and the string is a number
             * @tc.level     : Level 3
             * @tc.size      : MediumTest
             * @tc.type      : Function
             */
            it('AbilityRuntime_StartAndTerminate_StartAbility_3500', 3, async function (done) {

              const TAG='StartAbility';
              const TEST_SUITE_NAME : string='StartAbilityTest';
              const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3500';

              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

              var lifeMethodCalledCount = 0;

              //onCreate回调
              function onCreateCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(1);
              }
              //onWindowStageCreate回调
              function onWindowStageCreateCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(2);
              }
              //onForeground回调
              function onForegroundCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(3);
                done();
                lifeMethodCalledCount=0;
              }

              var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
              const abilityName = 'SecondAbility';

              //设置监听器,监听新ability的生命周期函数
              let monitor = {
                abilityName: abilityName,
                onAbilityCreate: onCreateCallback,
                onWindowStageCreate: onWindowStageCreateCallback,
                onAbilityForeground: onForegroundCallback
              };
              delegator.addAbilityMonitor(monitor, (async (err, result) => {
                let want = {
                  bundleName: 'com.example.mytest1',
                  abilityName: abilityName,
                  flags: '12345'
                }
                try{
                  // @ts-ignore
                  await delegator.startAbility(want).then(async () => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
                  }).catch((err) => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
                  })
                }catch (error){
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                }
              }))
            });


            /**
             * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3600
             * @tc.name      : Configure bundleName, activityName, and flags, where flags are non numeric strings
             * @tc.desc      : Call the startAbility interface through context, where the wantAbilityName
             *                 and bundleName are the correct values,the flag is a string, and the string is a non numeric value
             * @tc.level     : Level 3
             * @tc.size      : MediumTest
             * @tc.type      : Function
             */
            it('AbilityRuntime_StartAndTerminate_StartAbility_3600', 3, async function (done) {

              const TAG='StartAbility';
              const TEST_SUITE_NAME : string='StartAbilityTest';
              const TEST_CASE_NAME ='SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3600';

              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);

              var lifeMethodCalledCount = 0;

              //onCreate回调
              function onCreateCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onCreateCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(1);
              }
              //onWindowStageCreate回调
              function onWindowStageCreateCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageCreateCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(2);
              }
              //onForeground回调
              function onForegroundCallback() {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onForegroundCallback succ`);
                lifeMethodCalledCount++;
                expect(lifeMethodCalledCount).assertEqual(3);
                done();
                lifeMethodCalledCount = 0;
              }

              var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
              const abilityName = 'SecondAbility';

              //设置监听器,监听新ability的生命周期函数
              let monitor = {
                abilityName: abilityName,
                onAbilityCreate: onCreateCallback,
                onWindowStageCreate: onWindowStageCreateCallback,
                onAbilityForeground: onForegroundCallback
              };
              delegator.addAbilityMonitor(monitor, (async (err, result) => {
                let want = {
                  bundleName: 'com.example.mytest1',
                  abilityName: abilityName,
                  flags: 'falg'
                }
                try{
                  // @ts-ignore
                  await delegator.startAbility(want).then(async () => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
                  }).catch((err) => {
                    hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
                  })
                }catch (error){
                  hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                }
              }))
            });

      })
    }
