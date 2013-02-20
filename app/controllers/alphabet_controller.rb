class AlphabetController < UIViewController

	def viewDidLoad
		super

		self.title = "Alphabet"

		@table = UITableView.alloc.initWithFrame(self.view.bounds)
		self.view.addSubview @table

		@data = ("A".."Z").to_a

		@table.dataSource = self
		@table.delegate 	= self
	end

	def tableView(tableView, cellForRowAtIndexPath: indexPath)
		# return the UITableViewCell for the row
		@reuseIdentifier ||= "CELL_IDENTIFIER"

		cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
			UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
		end

		# put yoru data in the cell
		cell.textLabel.text = @data[indexPath.row]

		cell

	end

	def tableView(tableView, numberOfRowsInSection: section)
		# return the number of row
		@data.count
	end

	def tableView(tableView, didSelectRowAtIndexPath: indexPath)
		tableView.deselectRowAtIndexPath(indexPath, animated:true)

		alert = UIAlertView.alloc.init
		alert.message = "#{@data[indexPath.row]} tapped!"
		alert.addButtonWithTitle("OK")
		alert.show
	end

end
