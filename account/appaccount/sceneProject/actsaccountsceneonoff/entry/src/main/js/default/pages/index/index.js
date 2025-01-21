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
import account from '@ohos.account.appAccount'
import commonevent from '@ohos.commonEvent'
import featureAbility from '@ohos.ability.featureAbility'

const ACCOUNT_TEST_ONOFF_EXTRA = 1
const ACCOUNT_TEST_ONOFF_ASSOCIATEDDATA = 2
const ACCOUNT_TEST_ONOFF_CREDENTIAL = 3
const ACCOUNT_TEST_ONOFF_DELETE = 4
const ACCOUNT_TEST_ONOFF_DELETEONLY = 5
const ACCOUNT_TEST_ONOFF_DISABLE = 6
const ACCOUNT_TEST_ONOFF_DISABLEONLY = 7
const ACCOUNT_TEST_ONOFF_CUSTOMDATA = 8
const ACCOUNT_TEST_ONOFF_SETCREDENTIAL = 9
const ACCOUNT_TEST_ONOFF_REMOVE = 10
const ACCOUNT_TEST_ONOFF_REMOVEONLY = 11
const ACCOUNT_TEST_ONOFF_SETDISABLE = 12
const ACCOUNT_TEST_ONOFF_SETDISABLEONLY = 13
const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')

export default {
    data: {
    },
    onShow() {
       // this.title = "scene on off";
    },
    onInit() {
        this.title = "scene on off";
        console.info("====>change on off scene start====");
        var appAccountManager = account.createAppAccountManager();
        var commonEventSubscribeInfo = {
            events: ["account_on_change"]
        }

        // The callback of the event that publishes the verification result to the test application, and unsubscribe
        // the change of account information
        function publishCallback(err){
            console.info("====>publish call back scene err:" + JSON.stringify(err));
            console.info("====>scene off start====");
            appAccountManager.off('accountChange', function (){
                console.info("====>scene off accountChange finish====");
            });
            appAccountManager.off('change', function (){
                console.info("====>scene off change finish====");
            });
            featureAbility.terminateSelf()
        }

        // Subscribe to the callback of account information changes, verify the received account information, and send
        // an event with the verification result to the test application
        function changeOnExtra(data){
            console.info("====>receive change 0100 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccounttest" && data[0].name == "changeonoff_extra"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_extra", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_extra", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_extra", commonEventPublishData, publishCallback);
            }
        }

        function changeOnAssociateData(data){
            console.info("====>receive change 0200 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccounttest" && data[0].name == "onoff_associatedata"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_associatedata", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_associatedata", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_associatedata", commonEventPublishData, publishCallback);
            }
        }

        function changeOnCustomData(data){
            console.info("====>receive change 0200 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccountoperatetest" && data[0].name == "onoff_cunstomdata"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_cuntomdata", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_customdata", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_customdata", commonEventPublishData, publishCallback);
            }
        }

        function changeOnCredential(data){
            console.info("====>receive change 0300 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccounttest" && data[0].name == "onoff_credential"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_credential", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_credential", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_credential", commonEventPublishData, publishCallback);
            }
        }

        function changeOnSetCredential(data){
            console.info("====>receive change 0300 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccountoperatetest" && data[0].name == "onoff_setcredential"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_setcredential", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_setcredential", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_setcredential", commonEventPublishData, publishCallback);
            }
        }

        function changeOnDeleteAnother(data){
            console.info("====>receive change 0400 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccounttest" && data[0].name == "onoff_deleteFir"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_delete_another", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_delete_another", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_delete_another", commonEventPublishData, publishCallback);
            }
        }

        function changeOnRemoverAnother(data){
            console.info("====>receive change 0400 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccountoperatetest" && data[0].name == "onoff_removeFir"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_remove_another", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_remove_another", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_remove_another", commonEventPublishData, publishCallback);
            }
        }

        function changeOnDelete(data){
            console.info("====>receive change 0500 data:" + JSON.stringify(data));
            try{
                if(data.length == 0){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_delete", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_delete", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_delete", commonEventPublishData, publishCallback);
            }
        }

        function changeOnRemove(data){
            console.info("====>receive change 0500 data:" + JSON.stringify(data));
            try{
                if(data.length == 0){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_remove", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_remove", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_remove", commonEventPublishData, publishCallback);
            }
        }

        function changeOnDisableAnother(data){
            console.info("====>receive change 0600 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccounttest" && data[0].name == "onoff_enableFir"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_disable_another", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_disable_another", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_disable_another", commonEventPublishData, publishCallback);
            }
        }

        function changeOnSetAnotherDisable(data){
            console.info("====>receive change 1200 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccountoperatetest" && data[0].name == "onoff_disableFir"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_set_another_disable", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_set_another_disable", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_set_another_disable", commonEventPublishData, publishCallback);
            }
        }

        function changeOnDisable(data){
            console.info("====>receive change 0700 data:" + JSON.stringify(data));
            try{
                if(data.length == 0){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_disable", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_disable", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_disable", commonEventPublishData, publishCallback);
            }
        }

        function changeOnSetDisable(data){
            console.info("====>receive change 1300 data:" + JSON.stringify(data));
            try{
                if(data.length == 0){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_set_disable", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_set_disable", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_set_disable", commonEventPublishData, publishCallback);
            }
        }

        // Receive events sent by the test application to correspond to different test cases
        function subscriberCallback(err, data){
            console.info("====>receive event err:" + JSON.stringify(err));
            console.info("====>receive event data:" + JSON.stringify(data));
            switch(data.code){
                case ACCOUNT_TEST_ONOFF_EXTRA:
                    console.info("====>receive event 0100 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccounttest"], changeOnExtra);
                    break;
                case ACCOUNT_TEST_ONOFF_ASSOCIATEDDATA:
                    console.info("====>receive event 0200 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccounttest"], changeOnAssociateData);
                    break;
                case ACCOUNT_TEST_ONOFF_CREDENTIAL:
                    console.info("====>receive event 0300 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccounttest"], changeOnCredential);
                    break;
                case ACCOUNT_TEST_ONOFF_DELETE:
                    console.info("====>receive event 0400 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccounttest"], changeOnDeleteAnother);
                    break;
                case ACCOUNT_TEST_ONOFF_DELETEONLY:
                    console.info("====>receive event 0500 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccounttest"], changeOnDelete);
                    break;
                case ACCOUNT_TEST_ONOFF_DISABLE:
                    console.info("====>receive event 0600 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccounttest"], changeOnDisableAnother);
                    break;
                case ACCOUNT_TEST_ONOFF_DISABLEONLY:
                    console.info("====>receive event 0700 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccounttest"], changeOnDisable);
                    break;
                case ACCOUNT_TEST_ONOFF_CUSTOMDATA:
                    console.info("====>receive event 0800 event:" + data.event);
                    appAccountManager.on('accountChange', ["com.example.actsaccountoperatetest"], changeOnCustomData);
                    break;
                case ACCOUNT_TEST_ONOFF_SETCREDENTIAL:
                    console.info("====>receive event 0900 event:" + data.event);
                    appAccountManager.on('accountChange', ["com.example.actsaccountoperatetest"], changeOnSetCredential);
                    break;
                case ACCOUNT_TEST_ONOFF_REMOVE:
                    console.info("====>receive event 1000 event:" + data.event);
                    appAccountManager.on('accountChange', ["com.example.actsaccountoperatetest"], changeOnRemoverAnother);
                    break;
                case ACCOUNT_TEST_ONOFF_REMOVEONLY:
                    console.info("====>receive event 1100 event:" + data.event);
                    appAccountManager.on('accountChange', ["com.example.actsaccountoperatetest"], changeOnRemove);
                    break;
                case ACCOUNT_TEST_ONOFF_SETDISABLE:
                    console.info("====>receive event 1200 event:" + data.event);
                    appAccountManager.on('accountChange', ["com.example.actsaccountoperatetest"], changeOnSetAnotherDisable);
                    break;
                case ACCOUNT_TEST_ONOFF_SETDISABLEONLY:
                    console.info("====>receive event 1300 event:" + data.event);
                    appAccountManager.on('accountChange', ["com.example.actsaccountoperatetest"], changeOnSetDisable);
                    break;
                default:
                    console.info("====>receive event enter default====");
                    break;
            }    
        }
        var subscriber
        commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
            subscriber = data;
            commonevent.subscribe(subscriber, subscriberCallback);
            console.info("====>scene subscribe finish====")
        })
    },
    onReady() {
    },
}