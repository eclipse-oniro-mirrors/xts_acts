/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  assignSourceStrictStillOriginal as assignSourceStrictStillOriginalImpl,
  assignGlobalHasNoEffect as assignGlobalHasNoEffectImpl,
  execNamedGroupsYmd as execNamedGroupsYmdImpl,
  symbolMatchTwoMatches as symbolMatchTwoMatchesImpl,
  symbolMatchAllTwoMatches as symbolMatchAllTwoMatchesImpl,
  symbolReplaceAllDemo as symbolReplaceAllDemoImpl,
  symbolSearchIndex6 as symbolSearchIndex6Impl,
  symbolSplitThreeParts as symbolSplitThreePartsImpl,
  subclassSpeciesIsConstructor as subclassSpeciesIsConstructorImpl,
  regexpStaticLastIndexIsNumberOrUndefined as regexpStaticLastIndexIsNumberOrUndefinedImpl,
  globalPropertyNotEnumerable as globalPropertyNotEnumerableImpl,
  globalDescriptorIsNonWritableData as globalDescriptorIsNonWritableDataImpl,
  newRegExpInvalidBracketThrows as newRegExpInvalidBracketThrowsImpl,
  newRegExpInvalidUnicodeThrows as newRegExpInvalidUnicodeThrowsImpl,
  literalUnknownFlagThrows as literalUnknownFlagThrowsImpl,
  captureGroup10IsJ as captureGroup10IsJImpl,
  regexpWithDFlagHasIndicesTrue as regexpWithDFlagHasIndicesTrueImpl,
  regexpLiteralWithoutDNotHasIndices as regexpLiteralWithoutDNotHasIndicesImpl,
  execCoercesNullToString as execCoercesNullToStringImpl,
  execCoercesUndefinedToString as execCoercesUndefinedToStringImpl,
  execCoercesNumberToString as execCoercesNumberToStringImpl,
  execCoercesObjectWithToString as execCoercesObjectWithToStringImpl,
  execObjectCreateNullThrowsTypeError as execObjectCreateNullThrowsTypeErrorImpl,
  stringMatchAllNonGlobalRegExpThrows as stringMatchAllNonGlobalRegExpThrowsImpl,
  stringPrimitiveSymbolMatchAllNotCallable as stringPrimitiveSymbolMatchAllNotCallableImpl,
  nullSymbolMatchAllThrows as nullSymbolMatchAllThrowsImpl,
  stringMatchAllSameCountAsRegExpSymbolMatchAll as stringMatchAllSameCountAsRegExpSymbolMatchAllImpl,
  searchStringEqualsRegExpSymbolSearch as searchStringEqualsRegExpSymbolSearchImpl,
  searchCustomObjectWithSymbolSearch as searchCustomObjectWithSymbolSearchImpl,
  searchBigIntCoercesToString as searchBigIntCoercesToStringImpl,
  searchSymbolParameterThrowsTypeError as searchSymbolParameterThrowsTypeErrorImpl,
  searchFunctionCoercesToString as searchFunctionCoercesToStringImpl,
  searchObjectWithSymbolToPrimitive as searchObjectWithSymbolToPrimitiveImpl,
  regexpPrototypeSymbolSearchCallUndefinedThrows as regexpPrototypeSymbolSearchCallUndefinedThrowsImpl,
  regexpPrototypeSymbolSearchCallNullThrows as regexpPrototypeSymbolSearchCallNullThrowsImpl,
  regexpPrototypeSymbolSearchRegexLikeReturnsIndex as regexpPrototypeSymbolSearchRegexLikeReturnsIndexImpl,
  stringReplaceCustomSymbolReplace as stringReplaceCustomSymbolReplaceImpl,
  regexpPrototypeSymbolReplaceCallUndefinedThrows as regexpPrototypeSymbolReplaceCallUndefinedThrowsImpl,
  regexpPrototypeSymbolReplaceCallNullThrows as regexpPrototypeSymbolReplaceCallNullThrowsImpl,
  replaceTestWithNumber as replaceTestWithNumberImpl,
  replaceTestWithObjectToString as replaceTestWithObjectToStringImpl,
  replaceTestWithSymbolToPrimitive as replaceTestWithSymbolToPrimitiveImpl,
  replaceTestWithNull as replaceTestWithNullImpl,
  replaceTestWithUndefined as replaceTestWithUndefinedImpl,
  replaceTestWithSymbolValueThrows as replaceTestWithSymbolValueThrowsImpl,
  replaceTestWithBigInt as replaceTestWithBigIntImpl,
  replaceTestWithBoolean as replaceTestWithBooleanImpl,
  replaceTestWithArray as replaceTestWithArrayImpl,
  nonRegExpReceiverSymbolReplaceThrows as nonRegExpReceiverSymbolReplaceThrowsImpl,
  regexpPrototypeSymbolReplaceUndefinedThisThrows as regexpPrototypeSymbolReplaceUndefinedThisThrowsImpl,
  regexpPrototypeSymbolReplaceNullThisThrows as regexpPrototypeSymbolReplaceNullThisThrowsImpl,
  regexpPrototypeSymbolReplaceRegexLikeResult as regexpPrototypeSymbolReplaceRegexLikeResultImpl,
  replaceHelloHWithNumber as replaceHelloHWithNumberImpl,
  invalidRegExpCharClassCtorThrows as invalidRegExpCharClassCtorThrowsImpl,
  invalidRegExpFlagCtorThrows as invalidRegExpFlagCtorThrowsImpl,
  replaceOrCtorInvalidUnicodeCodePointThrows as replaceOrCtorInvalidUnicodeCodePointThrowsImpl,
  replaceOrCtorInvalidLookbehindThrows as replaceOrCtorInvalidLookbehindThrowsImpl,
  replaceOrCtorInvalidUnicodePropertyThrows as replaceOrCtorInvalidUnicodePropertyThrowsImpl,
  extreme17_1CustomSymbolReplaceObject as extreme17_1CustomSymbolReplaceObjectImpl,
  extreme17_2RegexpSymbolReplaceDirectCall as extreme17_2RegexpSymbolReplaceDirectCallImpl,
  extreme17_3ParameterOrderVerification as extreme17_3ParameterOrderVerificationImpl,
  extreme18_1RecursiveReplacement as extreme18_1RecursiveReplacementImpl,
  extreme18_2ConditionalReplacement as extreme18_2ConditionalReplacementImpl,
  extreme18_3AccumulativeReplacement as extreme18_3AccumulativeReplacementImpl,
  extreme18_4ContextAwareReplacement as extreme18_4ContextAwareReplacementImpl,
  extreme18_5LookupTableReplacement as extreme18_5LookupTableReplacementImpl,
  webCanInstantiateRegExp as webCanInstantiateRegExpImpl,
  webDetectHasIndicesFlag as webDetectHasIndicesFlagImpl,
  webSubclassReplaceUppercase as webSubclassReplaceUppercaseImpl,
  webSubclassReplaceLogging as webSubclassReplaceLoggingImpl,
  webSubclassSpeciesGlobalReplace as webSubclassSpeciesGlobalReplaceImpl,
  webMultipleReplaceChain as webMultipleReplaceChainImpl,
  webComplexEmailRedact as webComplexEmailRedactImpl,
  webSquareDigitsReplace as webSquareDigitsReplaceImpl,
  webEscapeHTML as webEscapeHTMLImpl,
  webUnescapeHTML as webUnescapeHTMLImpl,
  webToHyphenCase as webToHyphenCaseImpl,
  webToCamelCase as webToCamelCaseImpl,
  webFormatPhone as webFormatPhoneImpl,
  webMarkdownToHTML as webMarkdownToHTMLImpl,
  webEscapeSQL as webEscapeSQLImpl,
  webNormalizePath as webNormalizePathImpl,
  webFormatCurrency as webFormatCurrencyImpl,
  webMaskEmail as webMaskEmailImpl,
  splitDirectSymbolSplit as splitDirectSymbolSplitImpl,
  splitStringVsSymbolSame as splitStringVsSymbolSameImpl,
  splitSymbolWithLimit as splitSymbolWithLimitImpl,
  splitHasIndicesD as splitHasIndicesDImpl,
  splitSubclassOverride as splitSubclassOverrideImpl,
  splitSubclassCallSuper as splitSubclassCallSuperImpl,
  splitSubclassCallSuperOut as splitSubclassCallSuperOutImpl,
  splitSubclassCallSuperCount as splitSubclassCallSuperCountImpl,
  splitSpeciesEffect as splitSpeciesEffectImpl,
  splitSubclassConstructorCount as splitSubclassConstructorCountImpl,
  splitSubclassConstructorOut as splitSubclassConstructorOutImpl,
  splitSubclassConstructorSplitCount as splitSubclassConstructorSplitCountImpl,
  splitCustomSymbolObject as splitCustomSymbolObjectImpl,
  splitThisTypeErrors as splitThisTypeErrorsImpl,
  splitNonRegExpThisThrows as splitNonRegExpThisThrowsImpl,
  splitRegexLikeObjectCallResult as splitRegexLikeObjectCallResultImpl,
  splitRegexLikeObjectCallThrows as splitRegexLikeObjectCallThrowsImpl,
  splitRegexLikeObjectCallOut as splitRegexLikeObjectCallOutImpl,
  splitSymbolInputThrows as splitSymbolInputThrowsImpl,
  splitBigIntInput as splitBigIntInputImpl,
  splitToStringObjectInput as splitToStringObjectInputImpl,
  splitToPrimitiveInput as splitToPrimitiveInputImpl,
  splitArrayInput as splitArrayInputImpl,
  splitFunctionInput as splitFunctionInputImpl,
  splitCustomSplitterStateful as splitCustomSplitterStatefulImpl,
  splitCustomSplitterWithLimit as splitCustomSplitterWithLimitImpl,
  splitCustomSplitterValidate as splitCustomSplitterValidateImpl,
  splitCustomSplitterNonArrayReturn as splitCustomSplitterNonArrayReturnImpl,
  splitLimitStringInput as splitLimitStringInputImpl,
  splitSeparatorNullInput as splitSeparatorNullInputImpl,
  splitSeparatorNumberInput as splitSeparatorNumberInputImpl,
  splitSeparatorObjectInput as splitSeparatorObjectInputImpl,
  splitSupportsHasIndices as splitSupportsHasIndicesImpl,
  splitUndefinedSeparator as splitUndefinedSeparatorImpl,
  regexpTestCallThisNotRegExpThrows as regexpTestCallThisNotRegExpThrowsImpl,
  regexpTestCallThisUndefinedThrows as regexpTestCallThisUndefinedThrowsImpl,
  regexpTestCallThisNullThrows as regexpTestCallThisNullThrowsImpl,
  regexpTestCallRegexLikeObject as regexpTestCallRegexLikeObjectImpl,
  strictDeleteRegexSourceThrows as strictDeleteRegexSourceThrowsImpl,
  regexpTestSymbolParameterThrows as regexpTestSymbolParameterThrowsImpl,
  regexpTestToPrimitiveCoercionMatchesPrimitive as regexpTestToPrimitiveCoercionMatchesPrimitiveImpl,
  regexpTestBigintParameterMatches123 as regexpTestBigintParameterMatches123Impl,
  toStringDefinePropertySourceGetter as toStringDefinePropertySourceGetterImpl,
  toStringDefinePropertyFlagsGetter as toStringDefinePropertyFlagsGetterImpl,
  toStringGetterHijackSourceCalled as toStringGetterHijackSourceCalledImpl,
  regexpToStringCallNonRegExpThrows as regexpToStringCallNonRegExpThrowsImpl,
  regexpToStringCallNullThrows as regexpToStringCallNullThrowsImpl,
  regexpToStringCallUndefinedThrows as regexpToStringCallUndefinedThrowsImpl,
  regexpToStringCallStringThrows as regexpToStringCallStringThrowsImpl,
  regexpToStringCallNumberThrows as regexpToStringCallNumberThrowsImpl,
  regexpToStringOnFrozen as regexpToStringOnFrozenImpl,
  regexpToStringOnSealed as regexpToStringOnSealedImpl,
  definePropertyOnFrozenThrows as definePropertyOnFrozenThrowsImpl,
  regexpToStringApply as regexpToStringApplyImpl,
  regexpToStringBind as regexpToStringBindImpl,
  jsonStringifyRegExpIsEmptyObject as jsonStringifyRegExpIsEmptyObjectImpl,
  jsonStringifyWithToJSON as jsonStringifyWithToJSONImpl,
  regexpToStringByComputedName as regexpToStringByComputedNameImpl,
  regexpPrototypeToStringDescriptor as regexpPrototypeToStringDescriptorImpl,
  regexpToStringReconstructable as regexpToStringReconstructableImpl,
  regexpInstanceHasOwnToString as regexpInstanceHasOwnToStringImpl,
  regexpPrototypeHasOwnToString as regexpPrototypeHasOwnToStringImpl,
  regexpToStringSameAsPrototype as regexpToStringSameAsPrototypeImpl,
  objectPrototypeToStringOnRegExp as objectPrototypeToStringOnRegExpImpl,
  regexpOverrideToStringReturnsCustom as regexpOverrideToStringReturnsCustomImpl,
  regexpDeleteOverrideRestoresPrototype as regexpDeleteOverrideRestoresPrototypeImpl
} from './RegExpTest';

export function assignSourceStrictStillOriginal(): boolean {
  return assignSourceStrictStillOriginalImpl() as boolean;
}

export function assignGlobalHasNoEffect(): boolean {
  return assignGlobalHasNoEffectImpl() as boolean;
}

export function execNamedGroupsYmd(): boolean {
  return execNamedGroupsYmdImpl() as boolean;
}

export function symbolMatchTwoMatches(): boolean {
  return symbolMatchTwoMatchesImpl() as boolean;
}

export function symbolMatchAllTwoMatches(): boolean {
  return symbolMatchAllTwoMatchesImpl() as boolean;
}

export function symbolReplaceAllDemo(): boolean {
  return symbolReplaceAllDemoImpl() as boolean;
}

export function symbolSearchIndex6(): boolean {
  return symbolSearchIndex6Impl() as boolean;
}

export function symbolSplitThreeParts(): boolean {
  return symbolSplitThreePartsImpl() as boolean;
}

export function subclassSpeciesIsConstructor(): boolean {
  return subclassSpeciesIsConstructorImpl() as boolean;
}

export function regexpStaticLastIndexIsNumberOrUndefined(): boolean {
  return regexpStaticLastIndexIsNumberOrUndefinedImpl() as boolean;
}

export function globalPropertyNotEnumerable(): boolean {
  return globalPropertyNotEnumerableImpl() as boolean;
}

export function globalDescriptorIsNonWritableData(): boolean {
  return globalDescriptorIsNonWritableDataImpl() as boolean;
}

export function newRegExpInvalidBracketThrows(): boolean {
  return newRegExpInvalidBracketThrowsImpl() as boolean;
}

export function newRegExpInvalidUnicodeThrows(): boolean {
  return newRegExpInvalidUnicodeThrowsImpl() as boolean;
}

/** true: throws SyntaxError (spec) or does not throw (engine tolerance) */
export function literalUnknownFlagThrows(): boolean {
  return literalUnknownFlagThrowsImpl() as boolean;
}

export function captureGroup10IsJ(): boolean {
  return captureGroup10IsJImpl() as boolean;
}

export function regexpWithDFlagHasIndicesTrue(): boolean {
  return regexpWithDFlagHasIndicesTrueImpl() as boolean;
}

export function regexpLiteralWithoutDNotHasIndices(): boolean {
  return regexpLiteralWithoutDNotHasIndicesImpl() as boolean;
}


export function execCoercesNullToString(): boolean {
  return execCoercesNullToStringImpl() as boolean;
}

export function execCoercesUndefinedToString(): boolean {
  return execCoercesUndefinedToStringImpl() as boolean;
}

export function execCoercesNumberToString(): boolean {
  return execCoercesNumberToStringImpl() as boolean;
}

export function execCoercesObjectWithToString(): boolean {
  return execCoercesObjectWithToStringImpl() as boolean;
}

export function execObjectCreateNullThrowsTypeError(): boolean {
  return execObjectCreateNullThrowsTypeErrorImpl() as boolean;
}

export function stringMatchAllNonGlobalThrows(): boolean {
  return stringMatchAllNonGlobalRegExpThrowsImpl() as boolean;
}

export function stringPrimitiveSymbolMatchAllTypeError(): boolean {
  return stringPrimitiveSymbolMatchAllNotCallableImpl() as boolean;
}

export function nullSymbolMatchAllThrows(): boolean {
  return nullSymbolMatchAllThrowsImpl() as boolean;
}

export function stringMatchAllEqualsRegExpSymbolMatchAllCount(): boolean {
  return stringMatchAllSameCountAsRegExpSymbolMatchAllImpl() as boolean;
}

export function searchStringEqualsRegExpSymbolSearch(): boolean {
  return searchStringEqualsRegExpSymbolSearchImpl() as boolean;
}

export function searchCustomSymbolSearchObject(): boolean {
  return searchCustomObjectWithSymbolSearchImpl() as boolean;
}

export function searchBigIntCoerces(): boolean {
  return searchBigIntCoercesToStringImpl() as boolean;
}

export function searchSymbolParameterThrows(): boolean {
  return searchSymbolParameterThrowsTypeErrorImpl() as boolean;
}

export function searchFunctionCoerces(): boolean {
  return searchFunctionCoercesToStringImpl() as boolean;
}

export function searchObjectWithSymbolToPrimitive(): boolean {
  return searchObjectWithSymbolToPrimitiveImpl() as boolean;
}

export function regexpSearchCallUndefinedThrows(): boolean {
  return regexpPrototypeSymbolSearchCallUndefinedThrowsImpl() as boolean;
}

export function regexpSearchCallNullThrows(): boolean {
  return regexpPrototypeSymbolSearchCallNullThrowsImpl() as boolean;
}

export function regexpSearchRegexLikeIndex(): boolean {
  return regexpPrototypeSymbolSearchRegexLikeReturnsIndexImpl() as boolean;
}

export function stringReplaceCustomSymbolReplace(): boolean {
  return stringReplaceCustomSymbolReplaceImpl() as boolean;
}

export function regexpReplaceCallUndefinedThrows(): boolean {
  return regexpPrototypeSymbolReplaceCallUndefinedThrowsImpl() as boolean;
}

export function regexpReplaceCallNullThrows(): boolean {
  return regexpPrototypeSymbolReplaceCallNullThrowsImpl() as boolean;
}


export function replaceComplexReplaceTestWithNumber(): string {
  return replaceTestWithNumberImpl() as string;
}

export function replaceComplexReplaceTestWithObjectToString(): string {
  return replaceTestWithObjectToStringImpl() as string;
}

export function replaceComplexReplaceTestWithSymbolToPrimitive(): string {
  return replaceTestWithSymbolToPrimitiveImpl() as string;
}

export function replaceComplexReplaceTestWithNull(): string {
  return replaceTestWithNullImpl() as string;
}

export function replaceComplexReplaceTestWithUndefined(): string {
  return replaceTestWithUndefinedImpl() as string;
}

export function replaceComplexReplaceTestWithSymbolValueThrows(): boolean {
  return replaceTestWithSymbolValueThrowsImpl() as boolean;
}

export function replaceComplexReplaceTestWithBigInt(): string {
  return replaceTestWithBigIntImpl() as string;
}

export function replaceComplexReplaceTestWithBoolean(): string {
  return replaceTestWithBooleanImpl() as string;
}

export function replaceComplexReplaceTestWithArray(): string {
  return replaceTestWithArrayImpl() as string;
}

export function replaceComplexNonRegExpReceiverSymbolReplaceThrows(): boolean {
  return nonRegExpReceiverSymbolReplaceThrowsImpl() as boolean;
}

export function replaceComplexRegexpPrototypeSymbolReplaceUndefinedThisThrows(): boolean {
  return regexpPrototypeSymbolReplaceUndefinedThisThrowsImpl() as boolean;
}

export function replaceComplexRegexpPrototypeSymbolReplaceNullThisThrows(): boolean {
  return regexpPrototypeSymbolReplaceNullThisThrowsImpl() as boolean;
}

export function replaceComplexRegexpPrototypeSymbolReplaceRegexLikeResult(): string {
  return regexpPrototypeSymbolReplaceRegexLikeResultImpl() as string;
}

export function replaceComplexReplaceHelloHWithNumber(): string {
  return replaceHelloHWithNumberImpl() as string;
}

export function replaceComplexInvalidRegExpCharClassCtorThrows(): boolean {
  return invalidRegExpCharClassCtorThrowsImpl() as boolean;
}

export function replaceComplexInvalidRegExpFlagCtorThrows(): boolean {
  return invalidRegExpFlagCtorThrowsImpl() as boolean;
}

export function replaceComplexInvalidUnicodeCodePointThrows(): boolean {
  return replaceOrCtorInvalidUnicodeCodePointThrowsImpl() as boolean;
}

export function replaceComplexInvalidLookbehindThrows(): boolean {
  return replaceOrCtorInvalidLookbehindThrowsImpl() as boolean;
}

export function replaceComplexInvalidUnicodePropertyThrows(): boolean {
  return replaceOrCtorInvalidUnicodePropertyThrowsImpl() as boolean;
}


export function extreme17_1CustomSymbolReplaceObject(): string {
  return extreme17_1CustomSymbolReplaceObjectImpl() as string;
}

export function extreme17_2RegexpSymbolReplaceDirectCall(): string {
  return extreme17_2RegexpSymbolReplaceDirectCallImpl() as string;
}

export function extreme17_3ParameterOrderVerification(): boolean {
  return extreme17_3ParameterOrderVerificationImpl() as boolean;
}

export function extreme18_1RecursiveReplacement(): string {
  return extreme18_1RecursiveReplacementImpl() as string;
}

export function extreme18_2ConditionalReplacement(): string {
  return extreme18_2ConditionalReplacementImpl() as string;
}

export function extreme18_3AccumulativeReplacement(): string {
  return extreme18_3AccumulativeReplacementImpl() as string;
}

export function extreme18_4ContextAwareReplacement(): string {
  return extreme18_4ContextAwareReplacementImpl() as string;
}

export function extreme18_5LookupTableReplacement(): string {
  return extreme18_5LookupTableReplacementImpl() as string;
}


export function webCanInstantiateRegExp(pattern: string, flags: string = ''): boolean {
  return webCanInstantiateRegExpImpl(pattern, flags) as boolean;
}

export function webDetectHasIndices(): boolean {
  return webDetectHasIndicesFlagImpl() as boolean;
}

export function webSubclassReplaceUppercase(): string {
  return webSubclassReplaceUppercaseImpl() as string;
}

export function webSubclassReplaceLogging(): string {
  return webSubclassReplaceLoggingImpl() as string;
}

export function webSubclassSpeciesGlobalReplace(): string {
  return webSubclassSpeciesGlobalReplaceImpl() as string;
}

export function webMultipleReplaceChain(): string {
  return webMultipleReplaceChainImpl() as string;
}

export function webComplexEmailRedact(): string {
  return webComplexEmailRedactImpl() as string;
}

export function webSquareDigitsReplace(): string {
  return webSquareDigitsReplaceImpl() as string;
}

export function webEscapeHTML(str: string): string {
  return webEscapeHTMLImpl(str) as string;
}

export function webUnescapeHTML(str: string): string {
  return webUnescapeHTMLImpl(str) as string;
}

export function webToHyphenCase(str: string): string {
  return webToHyphenCaseImpl(str) as string;
}

export function webToCamelCase(str: string): string {
  return webToCamelCaseImpl(str) as string;
}

export function webFormatPhone(str: string): string {
  return webFormatPhoneImpl(str) as string;
}

export function webMarkdownToHTML(str: string): string {
  return webMarkdownToHTMLImpl(str) as string;
}

export function webEscapeSQL(str: string): string {
  return webEscapeSQLImpl(str) as string;
}

export function webNormalizePath(str: string): string {
  return webNormalizePathImpl(str) as string;
}

export function webFormatCurrency(str: string): string {
  return webFormatCurrencyImpl(str) as string;
}

export function webMaskEmail(str: string): string {
  return webMaskEmailImpl(str) as string;
}


export function splitDirectSymbolSplit(): string[] {
  return splitDirectSymbolSplitImpl() as string[];
}

export function splitStringVsSymbolSame(): boolean {
  return splitStringVsSymbolSameImpl() as boolean;
}

export function splitSymbolWithLimit(): string[] {
  return splitSymbolWithLimitImpl() as string[];
}

export function splitHasIndicesD(): string[] | null {
  return splitHasIndicesDImpl() as string[] | null;
}

export function splitSubclassOverride(): string[] {
  return splitSubclassOverrideImpl() as string[];
}

export function splitSubclassCallSuper(): Object {
  return splitSubclassCallSuperImpl() as Object;
}

export function splitSubclassCallSuperOut(): string[] {
  return splitSubclassCallSuperOutImpl() as string[];
}

export function splitSubclassCallSuperCount(): number {
  return splitSubclassCallSuperCountImpl() as number;
}

export function splitSpeciesEffect(): string[] {
  return splitSpeciesEffectImpl() as string[];
}

export function splitSubclassConstructorCount(): Object {
  return splitSubclassConstructorCountImpl() as Object;
}

export function splitSubclassConstructorOut(): string[] {
  return splitSubclassConstructorOutImpl() as string[];
}

export function splitSubclassConstructorSplitCount(): number {
  return splitSubclassConstructorSplitCountImpl() as number;
}

export function splitCustomSymbolObject(): string[] {
  return splitCustomSymbolObjectImpl() as string[];
}

export function splitThisTypeErrors(): boolean {
  return splitThisTypeErrorsImpl() as boolean;
}

export function splitNonRegExpThisThrows(): boolean {
  return splitNonRegExpThisThrowsImpl() as boolean;
}

export function splitRegexLikeObjectCallResult(): Object {
  return splitRegexLikeObjectCallResultImpl() as Object;
}

export function splitRegexLikeObjectCallThrows(): boolean {
  return splitRegexLikeObjectCallThrowsImpl() as boolean;
}

export function splitRegexLikeObjectCallOut(): string[] {
  return splitRegexLikeObjectCallOutImpl() as string[];
}

export function splitSymbolInputThrows(): boolean {
  return splitSymbolInputThrowsImpl() as boolean;
}

export function splitBigIntInput(): string[] {
  return splitBigIntInputImpl() as string[];
}

export function splitToStringObjectInput(): string[] {
  return splitToStringObjectInputImpl() as string[];
}

export function splitToPrimitiveInput(): string[] {
  return splitToPrimitiveInputImpl() as string[];
}

export function splitArrayInput(): string[] {
  return splitArrayInputImpl() as string[];
}

export function splitFunctionInput(): string[] {
  return splitFunctionInputImpl() as string[];
}

export function splitCustomSplitterStateful(): string[] {
  return splitCustomSplitterStatefulImpl() as string[];
}

export function splitCustomSplitterWithLimit(): string[] {
  return splitCustomSplitterWithLimitImpl() as string[];
}

export function splitCustomSplitterValidate(): string[] {
  return splitCustomSplitterValidateImpl() as string[];
}

export function splitCustomSplitterNonArrayReturn(): string[] {
  return splitCustomSplitterNonArrayReturnImpl() as string[];
}

export function splitLimitStringInput(): string[] {
  return splitLimitStringInputImpl() as string[];
}

export function splitSeparatorNullInput(): string[] {
  return splitSeparatorNullInputImpl() as string[];
}

export function splitSeparatorNumberInput(): string[] {
  return splitSeparatorNumberInputImpl() as string[];
}

export function splitSeparatorObjectInput(): string[] {
  return splitSeparatorObjectInputImpl() as string[];
}

export function splitSupportsHasIndices(): boolean {
  return splitSupportsHasIndicesImpl() as boolean;
}

export function splitUndefinedSeparator(): string[] {
  return splitUndefinedSeparatorImpl() as string[];
}


export function regexpTestCallThisNotRegExpThrows(): boolean {
  return regexpTestCallThisNotRegExpThrowsImpl() as boolean;
}

export function regexpTestCallThisUndefinedThrows(): boolean {
  return regexpTestCallThisUndefinedThrowsImpl() as boolean;
}

export function regexpTestCallThisNullThrows(): boolean {
  return regexpTestCallThisNullThrowsImpl() as boolean;
}

export function regexpTestCallRegexLikeObject(): boolean {
  return regexpTestCallRegexLikeObjectImpl() as boolean;
}

export function strictDeleteRegexSourceThrows(): boolean {
  return strictDeleteRegexSourceThrowsImpl() as boolean;
}

export function regexpTestSymbolParameterThrows(): boolean {
  return regexpTestSymbolParameterThrowsImpl() as boolean;
}

export function regexpTestToPrimitiveCoercionMatchesPrimitive(): boolean {
  return regexpTestToPrimitiveCoercionMatchesPrimitiveImpl() as boolean;
}

export function regexpTestBigintParameterMatches123(): boolean {
  return regexpTestBigintParameterMatches123Impl() as boolean;
}



export interface DescriptorResult {
  writable: boolean;
  enumerable: boolean;
  configurable: boolean;
}

export function toStringDefinePropertySourceGetter(): Object {
  return toStringDefinePropertySourceGetterImpl() as Object;
}

export function toStringDefinePropertyFlagsGetter(): Object {
  return toStringDefinePropertyFlagsGetterImpl() as Object;
}

export function toStringGetterHijackSourceCalled(): Object {
  return toStringGetterHijackSourceCalledImpl() as Object;
}

export function regexpToStringCallNonRegExpThrows(): boolean {
  return regexpToStringCallNonRegExpThrowsImpl() as boolean;
}

export function regexpToStringCallNullThrows(): boolean {
  return regexpToStringCallNullThrowsImpl() as boolean;
}

export function regexpToStringCallUndefinedThrows(): boolean {
  return regexpToStringCallUndefinedThrowsImpl() as boolean;
}

export function regexpToStringCallStringThrows(): boolean {
  return regexpToStringCallStringThrowsImpl() as boolean;
}

export function regexpToStringCallNumberThrows(): boolean {
  return regexpToStringCallNumberThrowsImpl() as boolean;
}

export function regexpToStringOnFrozen(): string {
  return regexpToStringOnFrozenImpl() as string;
}

export function regexpToStringOnSealed(): string {
  return regexpToStringOnSealedImpl() as string;
}

export function definePropertyOnFrozenThrows(): boolean {
  return definePropertyOnFrozenThrowsImpl() as boolean;
}

export function regexpToStringApply(): string {
  return regexpToStringApplyImpl() as string;
}

export function regexpToStringBind(): string {
  return regexpToStringBindImpl() as string;
}

export function jsonStringifyRegExpIsEmptyObject(): string {
  return jsonStringifyRegExpIsEmptyObjectImpl() as string;
}

export function jsonStringifyWithToJSON(): string {
  return jsonStringifyWithToJSONImpl() as string;
}

export function regexpToStringByComputedName(): string {
  return regexpToStringByComputedNameImpl() as string;
}

export function regexpPrototypeToStringDescriptor(): DescriptorResult {
  return regexpPrototypeToStringDescriptorImpl() as DescriptorResult;
}

export function regexpToStringReconstructable(): boolean {
  return regexpToStringReconstructableImpl() as boolean;
}

export function regexpInstanceHasOwnToString(): boolean {
  return regexpInstanceHasOwnToStringImpl() as boolean;
}

export function regexpPrototypeHasOwnToString(): boolean {
  return regexpPrototypeHasOwnToStringImpl() as boolean;
}

export function regexpToStringSameAsPrototype(): boolean {
  return regexpToStringSameAsPrototypeImpl() as boolean;
}

export function objectPrototypeToStringOnRegExp(): string {
  return objectPrototypeToStringOnRegExpImpl() as string;
}

export function regexpOverrideToStringReturnsCustom(): string {
  return regexpOverrideToStringReturnsCustomImpl() as string;
}

export function regexpDeleteOverrideRestoresPrototype(): string {
  return regexpDeleteOverrideRestoresPrototypeImpl() as string;
}

export * from './RegExpSymbols';


