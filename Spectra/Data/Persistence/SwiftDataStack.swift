import SwiftData

class SwiftDataStack {
    static let shared = SwiftDataStack()
    
    private var persistentContainer: NSPersistentContainer!

    private init() {
        setupCoreDataStack()
    }

    private func setupCoreDataStack() {
        persistentContainer = NSPersistentContainer(name: "SpectraDataModel")
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}