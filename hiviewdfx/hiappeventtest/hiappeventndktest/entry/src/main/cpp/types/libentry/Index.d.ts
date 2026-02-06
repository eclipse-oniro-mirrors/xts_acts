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

declare class HiAppEventProcessor {}

export type Processor = HiAppEventProcessor;
export const add: (a: number, b: number) => number;
export const oHHiAppEventWrite: () => number;
export const oHHiAppEventConfigure: () => number;
export const oHHiAppEventAddBoolParam: () => number;
export const oHHiAppEventAddBoolArrayParam: () => number;
export const oHHiAppEventAddInt8Param: () => number;
export const oHHiAppEventAddInt8ArrayParam: () => number;
export const oHHiAppEventAddInt16Param: () => number;
export const oHHiAppEventAddInt16ArrayParam: () => number;
export const oHHiAppEventAddInt32Param: () => number;
export const oHHiAppEventAddInt32ArrayParam: () => number;
export const oHHiAppEventAddInt64Param: () => number;
export const oHHiAppEventAddInt64ArrayParam: () => number;
export const oHHiAppEventAddFloatParam: () => number;
export const oHHiAppEventAddFloatArrayParam: () => number;
export const oHHiAppEventAddDoubleParam: () => number;
export const oHHiAppEventAddDoubleArrayParam: () => number;
export const oHHiAppEventAddStringParam: () => number;
export const oHHiAppEventAddStringArrayParam: () => number;
export const oHHiAppEventCreateParamList: () => number;
export const setAppEventFilter: () => number;
export const setAppEventFilterInvName: () => number;
export const setAppEventFilterInvDomain: () => number;
export const setAppEventFilterInvWatcher: () => number;
export const setTriggerCondition: () => number;
export const setTriggerConditionInvWatcher: () => number;
export const setWatcherOnTrigger: () => number;
export const setWatcherOnTriggerInvWatcher: () => number;
export const setWatcherOnReceive: () => number;
export const setWatcherOnReceiveInvWatcher: () => number;
export const takeWatcherData: () => number;
export const takeWatcherDataInvWatcher: () => number;
export const takeWatcherDataInvOperation: () => number;
export const addWatcher: () => number;
export const addWatcherInvWatcher: () => number;
export const removeWatcher: () => number;
export const removeWatcherInvWatcher: () => number;
export const removeWatcherInvOperation: () => number;
export const CreateProcessor: (name: string) => Processor;
export const SetReportRoute: (processor: Processor, appId: string, routeInfo: string) => number;
export const SetReportPolicy: (processor: Processor, periodReport: number, batchReport: number, onStartReport: boolean, onBackgroundReport:boolean) => number;
export const SetReportEvent: (processor: Processor, domain: string, name: string, isRealTime: boolean) => number;
export const SetCustomConfig: (processor: Processor, key: string, value: string) => number;
export const SetConfigId: (processor: Processor, configId: number) => number;
export const SetReportUserId: (processor: Processor, userIdNames: string[], size: number) => number;
export const SetReportUserProperty: (processor: Processor, userPropertyNames: string[], size: number) => number;
export const AddProcessor: (processor: Processor) => number;
export const RemoveProcessor: (processorId: number) => number;
export const DestroyProcessor: (processor: Processor) => void;
export const SetConfigName: (processor: Processor, configName: string) => number;
export const OHHiAppEventAddBoolParamReturn: () => number;
export const OHHiAppEventAddBoolArrayParamReturn: () => number;
export const OHHiAppEventAddInt8ParamReturn: () => number;
export const OHHiAppEventAddInt8ArrayParamReturn: () => number;
export const OHHiAppEventAddInt16ParamReturn: () => number;
export const OHHiAppEventAddInt16ArrayParamReturn: () => number;
export const OHHiAppEventAddInt32ParamReturn: () => number;
export const OHHiAppEventAddInt32ArrayParamReturn: () => number;
export const OHHiAppEventAddInt64ParamReturn: () => number;
export const OHHiAppEventAddInt64ArrayParamReturn: () => number;
export const OHHiAppEventAddFloatParamReturn: () => number;
export const OHHiAppEventAddFloatArrayParamReturn: () => number;
export const OHHiAppEventAddDoubleParamReturn: () => number;
export const OHHiAppEventAddDoubleArrayParamReturn: () => number;
export const OHHiAppEventAddStringParamReturn: () => number;
export const OHHiAppEventAddStringArrayParamReturn: () => number;
export const OHHiAppEventCreateWatcherReturn: () => number;
export const OHHiAppEventConfigureReturnTrue: () => number;
export const OHHiAppEventConfigureReturnFalse: () => number;