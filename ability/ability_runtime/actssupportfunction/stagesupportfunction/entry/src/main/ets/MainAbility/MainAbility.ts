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
import Ability from '@ohos.app.ability.UIAbility';
import commonEvent from '@ohos.commonEvent';

var TAG1 = 'StageSupportFunction:MainAbility:';
var listPush1 = "Stage_SupportFunction_MainAbility_";
var status1 = undefined;
let status2 = undefined;
var lifeList = [];
export default class MainAbility extends Ability {

    onCreate(want, launchParam) {
        console.log(TAG1 + 'onCreate : status1 : ' + status1 + ' ,ifeList : ' + JSON.stringify(lifeList));
        status1 = this.context.isTerminating();
        lifeList.push('onCreate');

        commonEvent.publish(listPush1 + "onCreate", (err) => {
            console.log(TAG1 + listPush1 + "onCreate");
        });

        setTimeout(() => {
            if (want.parameters.number == 1) {
                this.context.terminateSelf().then((data) => {
                    console.log(TAG1 + "terminateSelfWithResult data = " + JSON.stringify(data));
                }).catch((error) => {
                    console.log(TAG1 + "terminateSelfWithResult error = " + JSON.stringify(error));
                })
            }
            if (want.parameters.number == 2) {
                let wantNum = {
                    want: {
                        bundleName: "ohos.acts.aafwk.test.stagesupportfunction",
                        abilityName:"MainAbility"
                    },
                    resultCode: 12120
                }
                this.context.terminateSelfWithResult(wantNum).then((data) => {
                    console.log(TAG1 + "terminateSelfWithResult data = " + JSON.stringify(data));
                }).catch((error) => {
                    console.log(TAG1 + "terminateSelfWithResult error = " + JSON.stringify(error));
                })
            }
        }, 2000);
    }

    onDestroy() {
        console.log(TAG1 + 'onDestroy');
        lifeList.push('onDestroy');
        status2 = this.context.isTerminating();
        let options = {
            parameters: {
                isTerminating1: status1,
                isTerminating2: status2,
                lifeList: lifeList
            }
        }
        commonEvent.publish(listPush1 + "onDestroy", options, (err) => {
            console.log(TAG1 + listPush1 + "onDestroy");
        });
    }

    onWindowStageCreate(windowStage) {
        console.log(TAG1 + 'onWindowStageCreate');
        lifeList.push('onWindowStageCreate');

        windowStage.loadContent("pages/index", (err, data) => {
            if (err.code) {
                console.log(TAG1 + 'Failed to load the content. Cause:' + JSON.stringify(err));
                return;
            }
            console.log(TAG1 + 'Succeeded in loading the content. Data: ' + JSON.stringify(data));
        });
    }

    onWindowStageDestroy() {
        console.log(TAG1 + 'onWindowStageDestroy');
    }

    onForeground() {
        console.log(TAG1 + 'onForeground');
        lifeList.push('onForeground');
    }

    onBackground() {
        console.log(TAG1 + 'onBackground');
    }

    onBackPressed(): boolean {
        console.log(TAG1 + 'onBackPressed');
        return false;
    }
};
