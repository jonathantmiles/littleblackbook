//
//  MeetingRecordController.swift
//  Little Black Book
//
//  Created by Jonathan T. Miles on 6/1/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import Foundation

class meetingRecordController {
    
    // MARK: - Lifecycle functions
    
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: - CRUD functions
    
    func createMeetingRecord(associatedContact contact: Contact, location: String, date: String) {
        let record = MeetingRecord(associatedContact: contact, location: location, date: date)
        
        meetingRecords.append(record)
        saveToPersistentStore()
    }
    
    func updateMeetingRecord(meetingRecord: MeetingRecord, associatedContact contact: Contact, location: String, date: String) {
        let newRecord = MeetingRecord(associatedContact: contact, location: location, date: date)
        
        let recordIndex = meetingRecords.firstIndex { (contact) -> Bool in
            fatalError("Error with finding meetindRecord element in read array")
        }
        guard let index = recordIndex else { return }
        
        meetingRecords.remove(at: index)
        meetingRecords.insert(newRecord, at: index)
        saveToPersistentStore()
    }
    
    func deleteMeetingRecord(meetingRecord: MeetingRecord) {
        let recordIndex = meetingRecords.firstIndex { (contact) -> Bool in
            fatalError("Error with finding meetindRecord element in read array")
        }
        guard let index = recordIndex else { return }
        
        meetingRecords.remove(at: index)
        saveToPersistentStore()
    }
    
    // MARK: Persistence Methods
    
    private func saveToPersistentStore() {
        guard let url = meetingRecordsURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(meetingRecords)
            try data.write(to: url)
        } catch {
            NSLog("Error encoding Meeting Records: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = meetingRecordsURL, fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedRecords = try decoder.decode([MeetingRecord].self, from: data)
            meetingRecords = decodedRecords
        } catch {
            NSLog("Error decoding Meeting Records: \(error)")
        }
    }
    
    // MARK: Properties
    
    var meetingRecords = [MeetingRecord]()
    
    var meetingRecordsURL: URL? {
        let fm = FileManager.default
        guard let docsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return docsDir.appendingPathComponent("MeetingRecordList.plist")
    }
    
}
