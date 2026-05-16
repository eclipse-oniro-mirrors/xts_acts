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
// OHSensorGetInfosTest: case 0=GetInfos001, 1=GetInfos002
export const OHSensorGetInfosTest: (caseName: number) => number;

// OHSensorSubscribeTest: case 0-13 = Subscribe001~014
export const OHSensorSubscribeTest: (caseName: number) => number;

// OHSensorUnsubscribeTest: case 0-5 = Unsubscribe001~006
export const OHSensorUnsubscribeTest: (caseName: number) => number;

// OHSensorSubscriptionIdSetTypeTest: case 0-2 = SetType001~003
export const OHSensorSubscriptionIdSetTypeTest: (caseName: number) => number;

// OHSensorSubscriptionIdGetTypeTest: case 0-1 = GetType001~002
export const OHSensorSubscriptionIdGetTypeTest: (caseName: number) => number;

// OHSensorSubscriptionAttrSetSamplingIntervalTest: case 0-1 = SetSamplingInterval001~002
export const OHSensorSubscriptionAttrSetSamplingIntervalTest: (caseName: number) => number;

// OHSensorSubscriptionAttrGetSamplingIntervalTest: case 0-1 = GetSamplingInterval001~002
export const OHSensorSubscriptionAttrGetSamplingIntervalTest: (caseName: number) => number;

// OHSensorSubscriberSetCallbackTest: case 0-1 = SetCallback001~002
export const OHSensorSubscriberSetCallbackTest: (caseName: number) => number;

// OHSensorSubscriberGetCallbackTest: case 0-1 = GetCallback001~002
export const OHSensorSubscriberGetCallbackTest: (caseName: number) => number;
