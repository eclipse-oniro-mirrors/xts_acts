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

// OH Audio Render Tests
export const RendererCreationTest: (caseName: number) => Promise<number>;
export const LifecycleControlTest: (caseName: number) => Promise<number>;
export const ParameterGetterTest: (caseName: number) => Promise<number>;
export const VolumeControlTest: (caseName: number) => Promise<number>;
export const MarkPositionTest: (caseName: number) => Promise<number>;
export const UnderflowDetectionTest: (caseName: number) => Promise<number>;
export const WriteDataCallbackTest: (caseName: number) => Promise<number>;
export const LoudnessGainSetTest: (caseName: number) => Promise<number>;
export const LoudnessGainGetTest: (caseName: number) => Promise<number>;
export const StreamManagerTest: (caseName: number) => Promise<number>;
export const OhosCommonTest: () => number;
