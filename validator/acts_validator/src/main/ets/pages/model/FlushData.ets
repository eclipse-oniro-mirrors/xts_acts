/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import data_preferences from '@ohos.data.preferences';

export default class FlushData{
  static ResetArkUI = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('ArkUI', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'startup'. Data: " + data);
    });
    promise = preferences.put('ArkUI', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'test'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }
  static ResetAudio = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Audio', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'Audio'. Data: " + data);
    });
    promise = preferences.put('Audio', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'Audio'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }
  static ResetCamera = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Camera', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'startup'. Data: " + data);
    });
    promise = preferences.put('Camera', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'test'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }
  static ResetPlayer = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Player', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'Player'. Data: " + data);
    });
    promise = preferences.put('Player', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'Player'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }
  static ResetExperience = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Experience', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'Experience'. Data: " + data);
    });
    promise = preferences.put('Experience', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'Experience'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }
  static ResetPlayerAudio = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('PlayerAudio', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'PlayerAudio'. Data: " + data);
    });
    promise = preferences.put('PlayerAudio', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'PlayerAudio'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }
  static ResetPlayerVideo = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('PlayerVideo', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'PlayerVideo'. Data: " + data);
    });
    promise = preferences.put('PlayerVideo', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'PlayerVideo'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }
  static ResetPlayNetworkVideo = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('PlayerNetWork', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'PlayNetWork'. Data: " + data);
    });
    promise = preferences.put('PlayerNetWork', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'PlayNetWork'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }

  static ResetSensor = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Sensor', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'Sensor'. Data: " + data);
    });
    promise = preferences.put('Sensor', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'Sensor'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }

  static ResetScreen = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Screen', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'Screen'. Data: " + data);
    });
    promise = preferences.put('Screen', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'Screen'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }

  static ResetMultimodalInput = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('MultimodalInput', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'MultimodalInput'. Data: " + data);
    });
    promise = preferences.put('MultimodalInput', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'MultimodalInput'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }

  static ResetPower = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Power', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'Power'. Data: " + data);
    });
    promise = preferences.put('Power', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'Power'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }

  static ResetNotification = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Notification', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'Notification'. Data: " + data);
    });
    promise = preferences.put('Notification', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'Notification'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }

  static ResetWifi = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Wifi', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'Wifi'. Data: " + data);
    });
    promise = preferences.put('Wifi', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'Wifi'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }
  
  static ResetBluetooth = async ()=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    });
    promise = preferences.get('Bluetooth', 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'Bluetooth'. Data: " + data);
    });
    promise = preferences.put('Bluetooth', 0);
    promise.then(() => {
      console.info("Succeeded in putting value of 'Bluetooth'.");
    });
    promise = preferences.flush();
    promise.then(() => {
      console.info("Succeeded in flushing.");
    });
  }
}