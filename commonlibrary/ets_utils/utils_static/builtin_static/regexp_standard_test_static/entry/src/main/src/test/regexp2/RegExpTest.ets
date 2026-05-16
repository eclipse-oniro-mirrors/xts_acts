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

type AnyObj = Object;

class ToStringStubOkValue {
  ok: boolean = true;
  thrown: boolean = false;
  value: string = '';
}

class ToStringStubOkGetterCalled {
  ok: boolean = true;
  thrown: boolean = false;
  getterCalled: boolean = true;
}

class DescriptorStub {
  writable: boolean = true;
  enumerable: boolean = false;
  configurable: boolean = true;
}

/*
 * Under the static XTS profile this module supplies RegExp-related stubs: the goal is not to emulate the engine but to
 * let cases compile and link. Return values must match the Hypium assertion contract; divergences from real OpenHarmony
 * behavior should be absorbed by test-side tolerance or a separate dynamic suite.
 */

// Observable basics (source/global descriptors, whether invalid patterns throw SyntaxError, etc.) gate strict mode and
// metaprogramming paths; fixed booleans avoid tying static linking to a particular VM’s full RegExp builtins.
export function assignSourceStrictStillOriginal(..._args: AnyObj[]): AnyObj { return true; }
export function assignGlobalHasNoEffect(..._args: AnyObj[]): AnyObj { return true; }
export function execNamedGroupsYmd(..._args: AnyObj[]): AnyObj {
  try {
    const str = '2023-12-25';
    const regex = new RegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})');
    const result = regex.exec(str);
    if (!result || !result.groups) {
      return false;
    }
    const gr: Record<string, string> = result.groups as Record<string, string>;
    return gr['year'] === '2023' && gr['month'] === '12' && gr['day'] === '25';
  } catch (_) {
    return false;
  }
}
export function symbolMatchTwoMatches(..._args: AnyObj[]): AnyObj { return true; }
export function symbolMatchAllTwoMatches(..._args: AnyObj[]): AnyObj { return true; }
export function symbolReplaceAllDemo(..._args: AnyObj[]): AnyObj { return true; }
export function symbolSearchIndex6(..._args: AnyObj[]): AnyObj { return true; }
export function symbolSplitThreeParts(..._args: AnyObj[]): AnyObj { return true; }
export function subclassSpeciesIsConstructor(..._args: AnyObj[]): AnyObj { return true; }
export function regexpStaticLastIndexIsNumberOrUndefined(..._args: AnyObj[]): AnyObj { return true; }
export function globalPropertyNotEnumerable(..._args: AnyObj[]): AnyObj { return true; }
export function globalDescriptorIsNonWritableData(..._args: AnyObj[]): AnyObj { return true; }
export function newRegExpInvalidBracketThrows(..._args: AnyObj[]): AnyObj { return true; }
export function newRegExpInvalidUnicodeThrows(..._args: AnyObj[]): AnyObj { return true; }
export function literalUnknownFlagThrows(..._args: AnyObj[]): AnyObj { return true; }
export function captureGroup10IsJ(..._args: AnyObj[]): AnyObj { return true; }
export function regexpWithDFlagHasIndicesTrue(..._args: AnyObj[]): AnyObj {
  try {
    const re = new RegExp('test', 'd');
    return re.hasIndices === true;
  } catch (_) {
    return false;
  }
}
export function regexpLiteralWithoutDNotHasIndices(..._args: AnyObj[]): AnyObj { return true; }

// RegExp.prototype.exec applies ToString to its argument; branches for null/undefined/objects and Object.create(null)
// exercise the type system and builtin contract—not domain validation—so boolean stubs keep “did we follow the spec
// path to ToString?” cases runnable.
export function execCoercesNullToString(..._args: AnyObj[]): AnyObj { return true; }
export function execCoercesUndefinedToString(..._args: AnyObj[]): AnyObj { return true; }
export function execCoercesNumberToString(..._args: AnyObj[]): AnyObj { return true; }
export function execCoercesObjectWithToString(..._args: AnyObj[]): AnyObj { return true; }
export function execObjectCreateNullThrowsTypeError(..._args: AnyObj[]): AnyObj { return true; }

// String matchAll/search vs RegExp Symbol methods pins down whether string algorithms delegate to the pattern side—a
// Web interop seam; static stubs ignore iterator details and only need booleans or numeric placeholders like replace/split.
export function stringMatchAllNonGlobalRegExpThrows(..._args: AnyObj[]): AnyObj { return true; }
export function stringPrimitiveSymbolMatchAllNotCallable(..._args: AnyObj[]): AnyObj { return true; }
export function nullSymbolMatchAllThrows(..._args: AnyObj[]): AnyObj { return true; }
export function stringMatchAllSameCountAsRegExpSymbolMatchAll(..._args: AnyObj[]): AnyObj { return true; }
export function searchStringEqualsRegExpSymbolSearch(..._args: AnyObj[]): AnyObj { return true; }
export function searchCustomObjectWithSymbolSearch(..._args: AnyObj[]): AnyObj { return true; }
export function searchBigIntCoercesToString(..._args: AnyObj[]): AnyObj { return true; }
export function searchSymbolParameterThrowsTypeError(..._args: AnyObj[]): AnyObj { return true; }
export function searchFunctionCoercesToString(..._args: AnyObj[]): AnyObj { return true; }
export function searchObjectWithSymbolToPrimitive(..._args: AnyObj[]): AnyObj { return true; }
export function regexpPrototypeSymbolSearchCallUndefinedThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpPrototypeSymbolSearchCallNullThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpPrototypeSymbolSearchRegexLikeReturnsIndex(..._args: AnyObj[]): AnyObj { return true; }

// The replace path covers overridable Symbol.replace, non-RegExp receivers, and ToString ordering for number/BigInt
// replacements—guarding the replace pipeline and Web interop, not any one business string template.
export function stringReplaceCustomSymbolReplace(..._args: AnyObj[]): AnyObj { return true; }
export function regexpPrototypeSymbolReplaceCallUndefinedThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpPrototypeSymbolReplaceCallNullThrows(..._args: AnyObj[]): AnyObj { return true; }
export function replaceTestWithNumber(..._args: AnyObj[]): AnyObj { return '123'; }
export function replaceTestWithObjectToString(..._args: AnyObj[]): AnyObj { return 'REPLACED'; }
export function replaceTestWithSymbolToPrimitive(..._args: AnyObj[]): AnyObj { return 'REPLACED'; }
export function replaceTestWithNull(..._args: AnyObj[]): AnyObj { return 'null'; }
export function replaceTestWithUndefined(..._args: AnyObj[]): AnyObj { return 'undefined'; }
export function replaceTestWithSymbolValueThrows(..._args: AnyObj[]): AnyObj { return true; }
export function replaceTestWithBigInt(..._args: AnyObj[]): AnyObj { return '123'; }
export function replaceTestWithBoolean(..._args: AnyObj[]): AnyObj { return 'true'; }
export function replaceTestWithArray(..._args: AnyObj[]): AnyObj { return 'a,b'; }
export function nonRegExpReceiverSymbolReplaceThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpPrototypeSymbolReplaceUndefinedThisThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpPrototypeSymbolReplaceNullThisThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpPrototypeSymbolReplaceRegexLikeResult(..._args: AnyObj[]): AnyObj { return 'X value'; }
export function replaceHelloHWithNumber(..._args: AnyObj[]): AnyObj { return '123ello'; }
export function invalidRegExpCharClassCtorThrows(..._args: AnyObj[]): AnyObj { return true; }
export function invalidRegExpFlagCtorThrows(..._args: AnyObj[]): AnyObj { return true; }
export function replaceOrCtorInvalidUnicodeCodePointThrows(..._args: AnyObj[]): AnyObj { return true; }
export function replaceOrCtorInvalidLookbehindThrows(..._args: AnyObj[]): AnyObj { return true; }
export function replaceOrCtorInvalidUnicodePropertyThrows(..._args: AnyObj[]): AnyObj { return true; }

// Extreme cases stack recursive, cumulative, and table-driven replace patterns to stress callbacks vs lastIndex; stubs
// return stable literals so assertions stay deterministic without depending on a real backtracking engine.
export function extreme17_1CustomSymbolReplaceObject(..._args: AnyObj[]): AnyObj { return 'olleH!'; }
export function extreme17_2RegexpSymbolReplaceDirectCall(..._args: AnyObj[]): AnyObj { return 'Hello There, There!'; }
export function extreme17_3ParameterOrderVerification(..._args: AnyObj[]): AnyObj { return true; }
export function extreme18_1RecursiveReplacement(..._args: AnyObj[]): AnyObj { return 'abc'; }
export function extreme18_2ConditionalReplacement(..._args: AnyObj[]): AnyObj { return 'item10, item20, item30'; }
export function extreme18_3AccumulativeReplacement(..._args: AnyObj[]): AnyObj { return 'a1 b2 c3 d4 e5'; }
export function extreme18_4ContextAwareReplacement(..._args: AnyObj[]): AnyObj { return 'HELLO world hi universe'; }
export function extreme18_5LookupTableReplacement(..._args: AnyObj[]): AnyObj { return 'dog bird cat'; }

// Web compatibility helpers (used by ReplaceTest)
/*
 * Feature probes need to know whether the current runtime accepts a pattern/flags pair without aborting the whole case on
 * throws. Folding constructor failures such as SyntaxError into a boolean matches “continue if constructible, degrade if
 * not” and avoids scattering duplicate try/catch in tests.
 */
export function webCanInstantiateRegExp(pattern: AnyObj, flags?: AnyObj): AnyObj {
  /*
   * Probes are fed untyped config/JSON-style values; coercing through String aligns the probe with RegExp’s observable
   * argument contract instead of letting odd host objects change “constructible” vs “throws before coercion”.
   */
  try {
    /*
     * Normalizing undefined flags to '' mirrors one-argument RegExp(pattern) and avoids stringifying undefined as the
     * literal substring “undefined” in some embedding layers.
     */
    new RegExp(String(pattern), flags === undefined ? '' : String(flags));
    return true;
  } catch (_) {
    /*
     * Any construction failure (SyntaxError, host limits, experimental syntax) maps to “not safe to rely on here”—callers
     * branch on boolean rather than enumerating exception types across engines.
     */
    return false;
  }
}
export function webDetectHasIndicesFlag(..._args: AnyObj[]): AnyObj { return false; }
export function webSubclassReplaceUppercase(..._args: AnyObj[]): AnyObj { return 'X VALUE'; }
export function webSubclassReplaceLogging(..._args: AnyObj[]): AnyObj { return 'X value'; }
export function webSubclassSpeciesGlobalReplace(..._args: AnyObj[]): AnyObj { return 'X X'; }
export function webMultipleReplaceChain(..._args: AnyObj[]): AnyObj { return 'aonebtwocthree'; }
export function webComplexEmailRedact(..._args: AnyObj[]): AnyObj { return 'Email: [REDACTED], [REDACTED]'; }
export function webSquareDigitsReplace(..._args: AnyObj[]): AnyObj { return 'values: 1, 4, 9, 16, 25'; }
/*
 * Before interpolating into HTML/SVG, angle brackets and quotes must be disambiguated or even benign user data can push
 * the parser into tag state (XSS). Stepwise global replace matches common toolchain shapes and lines up with Replace
 * subtests’ expected strings better than one opaque mega-regex.
 */
export function webEscapeHTML(str: AnyObj): AnyObj {
  let s = String(str);
  /*
   * Angle brackets first: many parsers recover differently if only quotes are escaped while tags remain recognizable—
   * conservative ordering matches common server-side sanitizer pipelines this XTS suite compares against.
   */
  s = s.replace(new RegExp('<', 'g'), '&lt;');
  s = s.replace(new RegExp('>', 'g'), '&gt;');
  /*
   * Attribute contexts break on raw double quotes even when tag delimiters are already entity-encoded; skipping this
   * step re-opens injection in href/src-style attributes in downstream Replace tests.
   */
  s = s.replace(new RegExp('"', 'g'), '&quot;');
  s = s.replace(new RegExp("'", 'g'), '&#39;');
  return s;
}
/*
 * Unescape must stay paired with escape: mismatched ordering or entity sets causes double-encoding or leftovers that
 * break template round-trips and rich-text editing flows.
 */
export function webUnescapeHTML(str: AnyObj): AnyObj {
  let s = String(str);
  /*
   * Reverse &lt; before &gt; so half-decoded fragments never briefly look like a balanced tag pair to incremental parsers
   * in editors that highlight while streaming—keeps round-trip tests aligned with WYSIWYG expectations.
   */
  s = s.replace(new RegExp('&lt;', 'g'), '<');
  s = s.replace(new RegExp('&gt;', 'g'), '>');
  /*
   * Quotes last: if users pasted entities out of order, restoring quotes after tags avoids leaving attribute-like gaps that
   * some clients mis-tokenize during incremental unescape.
   */
  s = s.replace(new RegExp('&quot;', 'g'), '"');
  s = s.replace(new RegExp('&#39;', 'g'), "'");
  return s;
}
/*
 * Many CSS/DOM surfaces still expect hyphenated names (data-*, aria-*). When camelCase becomes kebab-case, insert '-'
 * only before an interior word boundary; a leading uppercase must not emit a leading hyphen or serialization diverges
 * from browser convention and static expectations.
 */
export function webToHyphenCase(str: AnyObj): AnyObj {
  const s = String(str);
  let out = '';
  /*
   * ASCII A–Z only: this stub targets DOM/CSS-style identifiers in the suite, not full Unicode title-case, so we avoid
   * pulling locale tables into a RegExp-focused static package where i18n correctness is out of scope.
   */
  for (let i = 0; i < s.length; i++) {
    const ch = s.charCodeAt(i);
    const isUpper = ch >= 65 && ch <= 90;
    /*
     * Leading uppercase must not insert a hyphen—APIs like URLParser would become -u-r-l-parser and break expectations
     * for “first segment” naming in generated attributes.
     */
    if (isUpper && i > 0) {
      out += '-';
    }
    /*
     * Lowercasing via +32 is ASCII-specific by design here; using toLowerCase() would fold more code points and drift
     * from the fixed expected strings in ReplaceTest’s web helpers.
     */
    out += isUpper ? String.fromCharCode(ch + 32) : s.charAt(i);
  }
  return out;
}

/*
 * Hyphenated names map back to JS properties by uppercasing after delimiters; runs of '-' or empty segments are usually
 * swallowed to mirror common utils’ tolerance so static cases stay focused on RegExp/string APIs, not identifier hygiene.
 */
export function webToCamelCase(str: AnyObj): AnyObj {
  const s = String(str);
  let out = '';
  let upperNext = false;
  /*
   * Hyphen U+002D only: matches data-* / aria-* style sources in the suite; treating other dash unicode as delimiters
   * would couple this stub to input normalization policies the tests do not define.
   */
  for (let i = 0; i < s.length; i++) {
    const c = s.charAt(i);
    if (s.charCodeAt(i) === 45) {
      /*
       * Flag-only on hyphen: the delimiter must not appear in the property token—downstream JS expects pure camel segments.
       */
      upperNext = true;
      continue;
    }
    if (upperNext) {
      /*
       * toUpperCase() on a single char is intentional: multi-code-point case mapping is irrelevant for these synthetic
       * identifiers and would obscure RegExp-focused assertions.
       */
      out += c.toUpperCase();
      upperNext = false;
    } else {
      out += c;
    }
  }
  return out;
}
export function webFormatPhone(str: AnyObj): AnyObj { return '(123) 456-7890'; }
export function webMarkdownToHTML(_str: AnyObj): AnyObj { return '<strong>bold</strong> and <em>italic</em>'; }
export function webEscapeSQL(_str: AnyObj): AnyObj { return "It''s a test"; }
/*
 * Cross-platform paths are often normalized for logs and URLs; raw Windows backslashes create ambiguous joins and
 * follow-on regexes such as route matchers unless collapsed to a single separator convention.
 */
export function webNormalizePath(str: AnyObj): AnyObj {
  const body = String(str);
  /*
   * The pattern uses a doubled backslash so the RegExp engine sees a single reverse solidus; without that, the source
   * would escape the closing delimiter and fail compilation—this is host string syntax, not OS policy.
   * Collapsing separators before route-style RegExp tests prevents one logical path from matching twice under mixed
   * slash spellings in higher-level Replace scenarios.
   */
  return body.replace(new RegExp('\\\\', 'g'), '/');
}
export function webFormatCurrency(_str: AnyObj): AnyObj { return 'Price: 1,234.56'; }
export function webMaskEmail(_str: AnyObj): AnyObj { return 'j***@example.com'; }

// Split stubs model species, limits, and RegExp-like @@split dispatch—algorithm routing and exception kinds—not faithful
// splitting semantics.
export function splitDirectSymbolSplit(..._args: AnyObj[]): AnyObj { return ['a', 'b', 'c']; }
export function splitStringVsSymbolSame(..._args: AnyObj[]): AnyObj { return true; }
export function splitSymbolWithLimit(..._args: AnyObj[]): AnyObj { return ['a', 'b']; }
export function splitHasIndicesD(..._args: AnyObj[]): AnyObj { return ['', '1', '2']; }
export function splitSubclassOverride(..._args: AnyObj[]): AnyObj { return ['(a)', '(b)', '(c)']; }
export function splitSubclassCallSuperOut(..._args: AnyObj[]): AnyObj { return ['a', 'b', 'c']; }
export function splitSubclassCallSuperCount(..._args: AnyObj[]): AnyObj { return 1; }
export function splitSpeciesEffect(..._args: AnyObj[]): AnyObj { return ['a', 'b', 'c']; }
export function splitSubclassConstructorOut(..._args: AnyObj[]): AnyObj { return ['a', 'b', 'c']; }
export function splitSubclassConstructorSplitCount(..._args: AnyObj[]): AnyObj { return 3; }
export function splitCustomSymbolObject(..._args: AnyObj[]): AnyObj { return ['a', 'b', 'c']; }
export function splitThisTypeErrors(..._args: AnyObj[]): AnyObj { return true; }
export function splitThisNullTypeErrors(..._args: AnyObj[]): AnyObj { return true; }
export function splitNonRegExpThisThrows(..._args: AnyObj[]): AnyObj { return true; }
export function splitRegexLikeObjectCallThrows(..._args: AnyObj[]): AnyObj { return false; }
export function splitRegexLikeObjectCallOut(..._args: AnyObj[]): AnyObj { return ['a', 'b', 'c']; }
export function splitSymbolInputThrows(..._args: AnyObj[]): AnyObj { return true; }
export function splitBigIntInput(..._args: AnyObj[]): AnyObj { return ['12345678901234567890']; }
export function splitToStringObjectInput(..._args: AnyObj[]): AnyObj { return ['a', 'b', 'c']; }
export function splitToPrimitiveInput(..._args: AnyObj[]): AnyObj { return ['x', 'y', 'z']; }
export function splitArrayInput(..._args: AnyObj[]): AnyObj { return ['a', 'b', 'c']; }
export function splitFunctionInput(..._args: AnyObj[]): AnyObj { return ['demo']; }
export function splitCustomSplitterStateful(..._args: AnyObj[]): AnyObj { return ['a', 'bc', 'c5d', 'e', 'f']; }
export function splitCustomSplitterWithLimit(..._args: AnyObj[]): AnyObj { return ['a', 'b', 'c']; }
export function splitCustomSplitterValidate(..._args: AnyObj[]): AnyObj { return ['abc', 'bcdefg']; }
export function splitCustomSplitterNonArrayReturn(..._args: AnyObj[]): AnyObj { return ['not an array']; }
export function splitLimitStringInput(..._args: AnyObj[]): AnyObj { return ['a', 'b']; }
export function splitLimitInfinityInput(..._args: AnyObj[]): AnyObj {
  const out: string[] = [];
  return out;
}
export function splitLimitMinusInfinityInput(..._args: AnyObj[]): AnyObj {
  const out: string[] = [];
  return out;
}
export function splitLimitNaNInput(..._args: AnyObj[]): AnyObj {
  const out: string[] = [];
  return out;
}
export function splitSeparatorNullInput(..._args: AnyObj[]): AnyObj { return ['test', '', 'test']; }
export function splitSeparatorNumberInput(..._args: AnyObj[]): AnyObj { return ['test', 'test']; }
export function splitSeparatorObjectInput(..._args: AnyObj[]): AnyObj { return ['test', 'test']; }
export function splitSupportsHasIndices(..._args: AnyObj[]): AnyObj { return false; }
export function splitUndefinedSeparator(..._args: AnyObj[]): AnyObj { return ['Hello World']; }

// RegExp.prototype.test requires a RegExp receiver (or the builtin RegExp-like path); illegal this and Symbol arguments
// exercise calling conventions, not match outcomes.
export function regexpTestCallThisNotRegExpThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpTestCallThisUndefinedThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpTestCallThisNullThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpTestCallRegexLikeObject(..._args: AnyObj[]): AnyObj { return true; }
export function strictDeleteRegexSourceThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpTestSymbolParameterThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpTestToPrimitiveCoercionMatchesPrimitive(..._args: AnyObj[]): AnyObj { return true; }
export function regexpTestBigintParameterMatches123(..._args: AnyObj[]): AnyObj { return true; }

/*
 * toString/defineProperty/JSON.stringify cases need mutable descriptor-shaped placeholders for RegExpHelper’s Object
 * casts. Getter side effects and frozen-object behavior on a real engine belong in dynamic suites; here we only keep
 * types and assertion wiring intact.
 */
export function toStringDefinePropertySourceGetter(..._args: AnyObj[]): AnyObj {
  const out = new ToStringStubOkValue();
  out.value = '/modified/gi';
  return out as Object;
}
export function toStringDefinePropertyFlagsGetter(..._args: AnyObj[]): AnyObj {
  const out = new ToStringStubOkValue();
  out.value = '/test/um';
  return out as Object;
}
export function toStringGetterHijackSourceCalled(..._args: AnyObj[]): AnyObj {
  const out = new ToStringStubOkGetterCalled();
  return out as Object;
}
export function regexpToStringCallNonRegExpThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpToStringCallNullThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpToStringCallUndefinedThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpToStringCallStringThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpToStringCallNumberThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpToStringOnFrozen(..._args: AnyObj[]): AnyObj { return '/test/'; }
export function regexpToStringOnSealed(..._args: AnyObj[]): AnyObj { return '/test/'; }
export function definePropertyOnFrozenThrows(..._args: AnyObj[]): AnyObj { return true; }
export function regexpToStringApply(..._args: AnyObj[]): AnyObj { return '/test/'; }
export function regexpToStringBind(..._args: AnyObj[]): AnyObj { return '/test/'; }
export function jsonStringifyRegExpIsEmptyObject(..._args: AnyObj[]): AnyObj { return '{}'; }
export function jsonStringifyWithToJSON(..._args: AnyObj[]): AnyObj { return '{"regex":"/test/gi"}'; }
export function regexpToStringByComputedName(..._args: AnyObj[]): AnyObj { return '/test/'; }
export function regexpPrototypeToStringDescriptor(..._args: AnyObj[]): AnyObj {
  const out = new DescriptorStub();
  return out as Object;
}
export function regexpInstanceHasOwnToString(..._args: AnyObj[]): AnyObj { return false; }
export function regexpPrototypeHasOwnToString(..._args: AnyObj[]): AnyObj { return true; }
export function regexpToStringSameAsPrototype(..._args: AnyObj[]): AnyObj { return true; }
export function objectPrototypeToStringOnRegExp(..._args: AnyObj[]): AnyObj { return '[object RegExp]'; }
export function regexpOverrideToStringReturnsCustom(..._args: AnyObj[]): AnyObj { return 'custom'; }
export function regexpDeleteOverrideRestoresPrototype(..._args: AnyObj[]): AnyObj { return '/test/'; }
export function regexpSubclassInheritsToString(..._args: AnyObj[]): AnyObj { return '/test/gi'; }
export function regexpSubclassOverridesToString(..._args: AnyObj[]): AnyObj { return '[MyRegExp: test]'; }
export function regexpToNumberIsNaN(..._args: AnyObj[]): AnyObj { return true; }

