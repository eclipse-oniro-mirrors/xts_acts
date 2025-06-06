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
import featureAbility from '@ohos.ability.featureAbility'

export default {
    data: {
        title: ''
    },
    onInit() {
        this.title = this.$t('strings.world');
    },
    onShow() {
        console.info('============Start Ability onShow finish');

        featureAbility.getWant(
            (err, data) => {
                data = data;
                console.info("==========err=" + JSON.stringify(err));
                console.info("==========data=" + JSON.stringify(data));
                if (data.parameters.hasOwnProperty("hasRemoteObject") && data.parameters.hasRemoteObject == true) {
                    console.info("==========parameters= hasRemoteObject is true.");
                    setTimeout(function(){
                        featureAbility.terminateSelfWithResult(
                            {
                                resultCode: 1,
                                want: data
                            }
                        );
                    },800);
                } else if (data.parameters.mykey5[1] == 'test123'){
                    console.info("==========parameters= second value of mykey5 is test123.");
                    featureAbility.getWant().then((data) =>{
                        data = data
                        setTimeout(function(){
                            console.info("==========data2 bundleName is===========" + JSON.stringify(data.bundleName));
                            featureAbility.terminateSelfWithResult(
                                {
                                    resultCode: 1,
                                    want: data
                                }
                            );
                        },1000);
                    });
                }else{
                    console.info("==========parameters= default branch.");
                    setTimeout(function(){
                        featureAbility.terminateSelfWithResult(
                            {
                                resultCode: 1,
                                want: data
                            }
                        );
                    },800);
                }
            }
        )
    },
    onReady() {
        console.info('onReady');
    },
}
