// Generated by Apple Swift version 4.1.2 (swiftlang-902.0.54 clang-902.0.39.2)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR __attribute__((enum_extensibility(open)))
# else
#  define SWIFT_ENUM_ATTR
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import AppKit;
@import Foundation;
@import CoreGraphics;
@import ObjectiveC;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="PRMacControls",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@class NSCoder;

SWIFT_CLASS("_TtC13PRMacControls8cOutline")
@interface cOutline : NSOutlineView
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSWindow;
@class NSNotification;
@class cmyTable;

SWIFT_CLASS("_TtC13PRMacControls15cbaseController")
@interface cbaseController : NSWindowController
@property (nonatomic, readonly) NSNibName _Nullable windowNibName;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithWindow:(NSWindow * _Null_unspecified)window OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
- (void)windowDidLoad;
- (void)chargements:(NSNotification * _Nonnull)notification;
- (void)enregistrementModifieWithTable:(cmyTable * _Nonnull)table key:(NSString * _Nonnull)key keyTable:(NSString * _Nonnull)keyTable params:(NSDictionary<NSString *, NSString *> * _Nonnull)params;
@end


@interface cbaseController (SWIFT_EXTENSION(PRMacControls)) <NSPopoverDelegate>
@end

@class NSTableView;

@interface cbaseController (SWIFT_EXTENSION(PRMacControls)) <NSTableViewDataSource>
- (NSInteger)numberOfRowsInTableView:(NSTableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
@end


@interface cbaseController (SWIFT_EXTENSION(PRMacControls)) <NSTextFieldDelegate>
- (void)controlTextDidBeginEditing:(NSNotification * _Nonnull)obj;
@end

@class NSTabView;
@class NSTabViewItem;

@interface cbaseController (SWIFT_EXTENSION(PRMacControls)) <NSTabViewDelegate>
- (BOOL)tabView:(NSTabView * _Nonnull)tabView shouldSelectTabViewItem:(NSTabViewItem * _Nullable)tabViewItem SWIFT_WARN_UNUSED_RESULT;
- (void)tabView:(NSTabView * _Nonnull)tabView didSelectTabViewItem:(NSTabViewItem * _Nullable)tabViewItem;
@end


@interface cbaseController (SWIFT_EXTENSION(PRMacControls)) <NSWindowDelegate>
- (void)windowDidResize:(NSNotification * _Nonnull)notification;
- (void)windowDidMove:(NSNotification * _Nonnull)notification;
- (BOOL)windowShouldClose:(NSWindow * _Nonnull)sender SWIFT_WARN_UNUSED_RESULT;
@end

@class NSEvent;

@interface cbaseController (SWIFT_EXTENSION(PRMacControls))
- (void)mouseEntered:(NSEvent * _Nonnull)event;
- (void)mouseExited:(NSEvent * _Nonnull)event;
@end




@interface cbaseController (SWIFT_EXTENSION(PRMacControls))
- (void)Modifier:(id _Nonnull)sender;
- (void)Ajouter:(id _Nonnull)sender;
- (void)Supprimer:(id _Nonnull)sender;
- (void)enregistrerWithCompletion:(void (^ _Nonnull)(BOOL))completion;
- (void)Annuler:(id _Nonnull)sender;
- (BOOL)Save:(id _Nonnull)sender SWIFT_WARN_UNUSED_RESULT;
@end

@class NSComboBox;

@interface cbaseController (SWIFT_EXTENSION(PRMacControls)) <NSComboBoxDataSource, NSComboBoxDelegate>
- (NSInteger)numberOfItemsInComboBox:(NSComboBox * _Nonnull)comboBox SWIFT_WARN_UNUSED_RESULT;
- (id _Nullable)comboBox:(NSComboBox * _Nonnull)comboBox objectValueForItemAtIndex:(NSInteger)index SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)comboBox:(NSComboBox * _Nonnull)comboBox indexOfItemWithStringValue:(NSString * _Nonnull)string SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)comboBox:(NSComboBox * _Nonnull)comboBox completedString:(NSString * _Nonnull)string SWIFT_WARN_UNUSED_RESULT;
- (void)comboBoxWillPopUp:(NSNotification * _Nonnull)notification;
- (void)comboBoxWillDismiss:(NSNotification * _Nonnull)notification;
- (void)comboBoxSelectionDidChange:(NSNotification * _Nonnull)notification;
@end

@class NSTableColumn;
@class NSView;
@class NSCell;
@class NSTableRowView;
@class NSSortDescriptor;

@interface cbaseController (SWIFT_EXTENSION(PRMacControls)) <NSTableViewDelegate>
- (void)tableViewSelectionDidChange:(NSNotification * _Nonnull)notification;
- (NSView * _Nullable)tableView:(NSTableView * _Nonnull)tableView viewForTableColumn:(NSTableColumn * _Nullable)tableColumn row:(NSInteger)row SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(NSTableView * _Nonnull)tableView didClickTableColumn:(NSTableColumn * _Nonnull)tableColumn;
- (BOOL)tableView:(NSTableView * _Nonnull)tableView shouldSelectTableColumn:(NSTableColumn * _Nullable)tableColumn SWIFT_WARN_UNUSED_RESULT;
- (BOOL)tableView:(NSTableView * _Nonnull)tableView shouldTrackCell:(NSCell * _Nonnull)cell forTableColumn:(NSTableColumn * _Nullable)tableColumn row:(NSInteger)row SWIFT_WARN_UNUSED_RESULT;
- (BOOL)tableView:(NSTableView * _Nonnull)tableView shouldShowCellExpansionForTableColumn:(NSTableColumn * _Nullable)tableColumn row:(NSInteger)row SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)tableView:(NSTableView * _Nonnull)tableView toolTipForCell:(NSCell * _Nonnull)cell rect:(NSRectPointer _Nonnull)rect tableColumn:(NSTableColumn * _Nullable)tableColumn row:(NSInteger)row mouseLocation:(NSPoint)mouseLocation SWIFT_WARN_UNUSED_RESULT;
- (NSTableRowView * _Nullable)tableView:(NSTableView * _Nonnull)tableView rowViewForRow:(NSInteger)row SWIFT_WARN_UNUSED_RESULT;
- (void)tableViewSelectionIsChanging:(NSNotification * _Nonnull)notification;
- (BOOL)tableView:(NSTableView * _Nonnull)tableView shouldSelectRow:(NSInteger)row SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(NSTableView * _Nonnull)tableView sortDescriptorsDidChange:(NSArray<NSSortDescriptor *> * _Nonnull)oldDescriptors;
@end

@class NSBundle;

SWIFT_CLASS("_TtC13PRMacControls9cbaseView")
@interface cbaseView : NSViewController
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSNibName _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil SWIFT_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


@interface cbaseView (SWIFT_EXTENSION(PRMacControls)) <NSPopoverDelegate>
@end


@interface cbaseView (SWIFT_EXTENSION(PRMacControls)) <NSTableViewDataSource>
- (NSInteger)numberOfRowsInTableView:(NSTableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
@end


@interface cbaseView (SWIFT_EXTENSION(PRMacControls)) <NSTextFieldDelegate>
- (void)controlTextDidBeginEditing:(NSNotification * _Nonnull)obj;
@end


@interface cbaseView (SWIFT_EXTENSION(PRMacControls)) <NSTabViewDelegate>
- (BOOL)tabView:(NSTabView * _Nonnull)tabView shouldSelectTabViewItem:(NSTabViewItem * _Nullable)tabViewItem SWIFT_WARN_UNUSED_RESULT;
- (void)tabView:(NSTabView * _Nonnull)tabView didSelectTabViewItem:(NSTabViewItem * _Nullable)tabViewItem;
@end






@interface cbaseView (SWIFT_EXTENSION(PRMacControls)) <NSTableViewDelegate>
- (void)tableViewSelectionDidChange:(NSNotification * _Nonnull)notification;
- (NSView * _Nullable)tableView:(NSTableView * _Nonnull)tableView viewForTableColumn:(NSTableColumn * _Nullable)tableColumn row:(NSInteger)row SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(NSTableView * _Nonnull)tableView didClickTableColumn:(NSTableColumn * _Nonnull)tableColumn;
- (BOOL)tableView:(NSTableView * _Nonnull)tableView shouldSelectTableColumn:(NSTableColumn * _Nullable)tableColumn SWIFT_WARN_UNUSED_RESULT;
- (BOOL)tableView:(NSTableView * _Nonnull)tableView shouldTrackCell:(NSCell * _Nonnull)cell forTableColumn:(NSTableColumn * _Nullable)tableColumn row:(NSInteger)row SWIFT_WARN_UNUSED_RESULT;
- (BOOL)tableView:(NSTableView * _Nonnull)tableView shouldShowCellExpansionForTableColumn:(NSTableColumn * _Nullable)tableColumn row:(NSInteger)row SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)tableView:(NSTableView * _Nonnull)tableView toolTipForCell:(NSCell * _Nonnull)cell rect:(NSRectPointer _Nonnull)rect tableColumn:(NSTableColumn * _Nullable)tableColumn row:(NSInteger)row mouseLocation:(NSPoint)mouseLocation SWIFT_WARN_UNUSED_RESULT;
- (NSTableRowView * _Nullable)tableView:(NSTableView * _Nonnull)tableView rowViewForRow:(NSInteger)row SWIFT_WARN_UNUSED_RESULT;
- (void)tableViewSelectionIsChanging:(NSNotification * _Nonnull)notification;
- (BOOL)tableView:(NSTableView * _Nonnull)tableView shouldSelectRow:(NSInteger)row SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC13PRMacControls15ceditController")
@interface ceditController : cbaseController
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithWindow:(NSWindow * _Null_unspecified)window OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
- (void)chargements:(NSNotification * _Nonnull)notification;
- (void)Annuler:(id _Nonnull)sender;
- (void)Ajouter:(id _Nonnull)sender;
- (void)enregistrerWithCompletion:(void (^ _Nonnull)(BOOL))completion;
@end




SWIFT_CLASS("_TtC13PRMacControls15clistController")
@interface clistController : cbaseController
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithWindow:(NSWindow * _Null_unspecified)window OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
- (void)windowWillLoad;
- (void)windowDidLoad;
- (void)chargements:(NSNotification * _Nonnull)notification;
@end






@interface clistController (SWIFT_EXTENSION(PRMacControls))
- (void)Annuler:(id _Nonnull)sender;
- (void)Ajouter:(id _Nonnull)sender;
- (void)Modifier:(id _Nonnull)sender;
- (void)enregistrerWithCompletion:(void (^ _Nonnull)(BOOL))completion;
- (BOOL)Save:(id _Nonnull)sender SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC13PRMacControls6cmyBox")
@interface cmyBox : NSBox
@property (nonatomic, getter=isHidden) BOOL hidden;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)decoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls11cmyCheckbox")
@interface cmyCheckbox : NSButton
@property (nonatomic) BOOL isFiltre;
@property (nonatomic, readonly) BOOL acceptsFirstResponder;
- (BOOL)becomeFirstResponder SWIFT_WARN_UNUSED_RESULT;
- (BOOL)resignFirstResponder SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, copy) NSString * _Nonnull stringValue;
- (void)mouseDown:(NSEvent * _Nonnull)event;
- (void)drawRect:(NSRect)dirtyRect;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls9cmyColumn")
@interface cmyColumn : NSTableColumn
- (nonnull instancetype)initWithIdentifier:(NSUserInterfaceItemIdentifier _Nonnull)identifier OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls8cmyCombo")
@interface cmyCombo : NSComboBox
@property (nonatomic) BOOL obligatoire;
@property (nonatomic) BOOL isFiltre;
@property (nonatomic) BOOL isLabel;
@property (nonatomic) BOOL isBloque;
@property (nonatomic, readonly) BOOL acceptsFirstResponder;
- (BOOL)becomeFirstResponder SWIFT_WARN_UNUSED_RESULT;
- (BOOL)resignFirstResponder SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, copy) NSString * _Nonnull stringValue;
- (void)keyUp:(NSEvent * _Nonnull)event;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls10cmyControl")
@interface cmyControl : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_DEPRECATED_MSG("-init is unavailable");
@end






SWIFT_CLASS("_TtC13PRMacControls13cmyControlDoc")
@interface cmyControlDoc : NSButton
@property (nonatomic, readonly) BOOL acceptsFirstResponder;
- (void)mouseEntered:(NSEvent * _Nonnull)event;
- (void)mouseExited:(NSEvent * _Nonnull)event;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls17cmyCustomCheckbox")
@interface cmyCustomCheckbox : NSView
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidMoveToWindow;
- (void)mouseUp:(NSEvent * _Nonnull)event;
- (void)keyDown:(NSEvent * _Nonnull)event;
- (void)drawRect:(NSRect)dirtyRect;
@end


@interface cmyCustomCheckbox (SWIFT_EXTENSION(PRMacControls))
- (id _Nullable)accessibilityValue SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)accessibilityLabel SWIFT_WARN_UNUSED_RESULT;
- (BOOL)accessibilityPerformPress SWIFT_WARN_UNUSED_RESULT;
@end


@interface cmyCustomCheckbox (SWIFT_EXTENSION(PRMacControls))
@property (nonatomic, readonly) BOOL acceptsFirstResponder;
- (BOOL)becomeFirstResponder SWIFT_WARN_UNUSED_RESULT;
- (BOOL)resignFirstResponder SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC13PRMacControls11cmySelector")
@interface cmySelector : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_DEPRECATED_MSG("-init is unavailable");
@end

@class NSResponder;

SWIFT_CLASS("_TtC13PRMacControls8cmyTable")
@interface cmyTable : NSTableView
- (void)reloadData;
@property (nonatomic, readonly) BOOL acceptsFirstResponder;
- (BOOL)becomeFirstResponder SWIFT_WARN_UNUSED_RESULT;
- (BOOL)resignFirstResponder SWIFT_WARN_UNUSED_RESULT;
- (BOOL)validateProposedFirstResponder:(NSResponder * _Nonnull)responder forEvent:(NSEvent * _Nullable)event SWIFT_WARN_UNUSED_RESULT;
- (void)mouseUp:(NSEvent * _Nonnull)event;
- (NSTableRowView * _Nullable)rowViewAtRow:(NSInteger)row makeIfNecessary:(BOOL)makeIfNecessary SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end




SWIFT_CLASS("_TtC13PRMacControls14cmyTabviewItem")
@interface cmyTabviewItem : NSTabViewItem
- (nonnull instancetype)initWithIdentifier:(id _Nullable)identifier OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls12cmyTextfield")
@interface cmyTextfield : NSTextField <NSTextFieldDelegate>
@property (nonatomic) BOOL obligatoire;
@property (nonatomic) BOOL isFiltre;
@property (nonatomic) BOOL onsubmit;
@property (nonatomic) BOOL isLabel;
@property (nonatomic) BOOL majuscules;
@property (nonatomic, copy) NSString * _Nonnull submitMethod;
@property (nonatomic, readonly) BOOL acceptsFirstResponder;
- (BOOL)becomeFirstResponder SWIFT_WARN_UNUSED_RESULT;
- (BOOL)resignFirstResponder SWIFT_WARN_UNUSED_RESULT;
- (void)keyUp:(NSEvent * _Nonnull)event;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls15cmyTextFieldNum")
@interface cmyTextFieldNum : cmyTextfield
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls19cmyTextFieldDecimal")
@interface cmyTextFieldDecimal : cmyTextFieldNum
@property (nonatomic, copy) NSString * _Nonnull stringValue;
@property (nonatomic) float floatValue;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls15cmyTextFieldInt")
@interface cmyTextFieldInt : cmyTextFieldNum
@property (nonatomic, copy) NSString * _Nonnull stringValue;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end




SWIFT_CLASS("_TtC13PRMacControls19cmyTextfieldAdresse")
@interface cmyTextfieldAdresse : cmyTextfield
@property (nonatomic, copy) NSString * _Nonnull stringValue;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls16cmyTextfieldDate")
@interface cmyTextfieldDate : cmyTextfield
@property (nonatomic, copy) NSString * _Nonnull stringValue;
- (void)insertText:(id _Nonnull)insertString;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls15cmyTextfieldDoc")
@interface cmyTextfieldDoc : cmyTextfield
- (void)mouseEntered:(NSEvent * _Nonnull)event;
- (void)mouseExited:(NSEvent * _Nonnull)event;
- (void)mouseDown:(NSEvent * _Nonnull)event;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls21cmyTextfieldTelephone")
@interface cmyTextfieldTelephone : cmyTextfield
@property (nonatomic, copy) NSString * _Nonnull stringValue;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls14cmyToolbarItem")
@interface cmyToolbarItem : NSToolbarItem
- (nonnull instancetype)initWithItemIdentifier:(NSToolbarItemIdentifier _Nonnull)itemIdentifier OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls7cmyView")
@interface cmyView : NSView
- (BOOL)acceptsFirstMouse:(NSEvent * _Nullable)event SWIFT_WARN_UNUSED_RESULT;
- (void)mouseDown:(NSEvent * _Nonnull)event;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)decoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13PRMacControls9cmyWindow")
@interface cmyWindow : NSWindow
- (void)sendEvent:(NSEvent * _Nonnull)event;
- (nonnull instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)backingStoreType defer:(BOOL)flag OBJC_DESIGNATED_INITIALIZER;
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
