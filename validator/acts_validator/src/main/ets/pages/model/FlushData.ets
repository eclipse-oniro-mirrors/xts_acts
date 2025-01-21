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
}